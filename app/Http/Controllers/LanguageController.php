<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Language;
use App\Models\Setting;
use App\Models\Translation;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LanguageController extends Controller
{
    public function index()
    {
        $name = 'languages';
        return view('app', compact('name'));
    }

    public function fetch_languages()
    {
        return Language::all();
    }

    public function languages_add()
    {
        $name = 'language-create';
        return view('app', compact('name'));
    }

    public function countries()
    {
        return Country::pluck('name', 'iso2');
    }

    public function language_save(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:250',
            'code' => 'required|max:50',
        ]);
        if ($request->id) {
            $language = Language::findOrFail($request->id);
        } else {
            $language = new Language;
            $language->id = Str::orderedUuid();
        }

        $language->name = $request->name;
        $language->code = $request->code;
        $language->save();

        return 'success';
    }

    public function edit_language($id)
    {
        return view('app', compact('id'));
    }

    public function get_language($id)
    {
        $language = Language::where('id', $id)->first();
        return $language;
    }
    public function languages_delete($id)
    {
        $language = Language::where('id', $id)->where('code', '!=', 'US')->first();
        if ($language) {
            $language->delete();
        }
        return 'success';
    }

    public function translations_show($id)
    {
        // update missing language keys here from main language
        $language = Language::findOrFail($id);
        $main_lang = 'US';
        if ($language->code != $main_lang) {

            $main_lang_translations = Translation::where('lang', $main_lang)->get();

            foreach ($main_lang_translations as $main_lang_translation) {

                $translation = Translation::where('lang_key', $main_lang_translation->lang_key)
                    ->where('lang', $language->code)
                    ->whereRaw("BINARY lang_key = ?", [$main_lang_translation->lang_key])
                    ->first();
                if ($translation == null) {
                    $translation = new Translation;
                    $translation->id = Str::orderedUuid();
                    $translation->lang = $language->code;
                    $translation->lang_key = $main_lang_translation->lang_key;
                    $translation->lang_value = $main_lang_translation->lang_value; // Update to use lang_value from main language
                    $translation->save();
                }
            }
        }
        return view('app', compact('id'));
    }
    public function translations_record_show($id)
    {
        // update missing language keys here from main language
        $language = Language::findOrFail($id);
        $main_lang = 'US';
        $main_lang_translations = Translation::where('lang', $main_lang)->get();

        foreach ($main_lang_translations as $main_lang_translation) {
            $translation = Translation::where('lang_key', $main_lang_translation->lang_key)->where('lang', $language->code)->first();

            if ($translation == null) {
                $translation = new Translation;
                $translation->id = Str::orderedUuid();
                $translation->lang = $language->code;
                $translation->lang_key = $main_lang_translation->lang_key;
                $translation->lang_value = $main_lang_translation->lang_key;
                $translation->save();
            }
        }

        return Inertia::render('Backend/Language/Translations', [
            'language_id' => $id,
        ]);
    }

    public function translations(Request $request)
    {
        $language = Language::where('id', $request->language_id)->first();

        $translations = Translation::where('lang', $language->code)->paginate(50);
        return $translations;
    }

    public function translations_store(Request $request)
    {
        $language = Language::findOrFail($request->language_id);

        foreach ($request->values as $key => $value) {
            $translation_def = Translation::whereRaw("BINARY lang_key = '$key'")->where('lang', $language->code)->first();
            if ($translation_def == null) {
                $translation_def = new Translation;
                $translation_def->id = Str::orderedUuid();
                $translation_def->lang = $language->code;
                $translation_def->lang_key = $key;
                $translation_def->lang_value = $value;
                $translation_def->save();
            } else {
                $translation_def->lang_value = $value;
                $translation_def->save();
            }
        }

        return 'success';
    }

    public function translations_search(Request $request)
    {
        $language = Language::findOrFail($request->language_id);

        $translations = Translation::where('lang', $language->code)
            ->where('lang_key', 'like', '%' . $request->search . '%')->paginate(50);

        return $translations;
    }

    public function translate(Request $request)
    {
        $lang = 'br';
        $key = $request->value;

        $translation_def = Translation::where('lang', $lang)->where('lang_key', $key)->first();
        if ($translation_def == null) {
            $translation_def = new Translation;
            $translation_def->id = Str::orderedUuid();
            $translation_def->lang = $lang;
            $translation_def->lang_key = $key;
            $translation_def->lang_value = $key;
            $translation_def->save();
        }

        //Check for session lang
        $translation_locale = Translation::where('lang_key', $key)->where('lang', $lang)->first();
        if ($translation_locale != null) {
            return $translation_locale->lang_value;
        } else {
            return $translation_def->lang_value;
        }
    }

    public function missing_translations_store(Request $request)
    {
        $setting = Setting::where('type', 'default_language')->first();
        $default_lang = 'US';
        $translation_dif = Translation::where('lang', $default_lang)->whereRaw("BINARY lang_key = '$request->value'")->first();

        if ($translation_dif == null) {

            // adding for the main language
            $translation_dif = new Translation;
            $translation_dif->id = Str::orderedUuid();
            $translation_dif->lang = $default_lang;
            $translation_dif->lang_key = $request->value;
            $translation_dif->lang_value = $request->value;
            $translation_dif->save();

            if ($default_lang != $setting->value) {
                // adding for the current language if its not same as default language
                $translation_dif = new Translation;
                $translation_dif->id = Str::orderedUuid();
                $translation_dif->lang = $setting->value;
                $translation_dif->lang_key = $request->value;
                $translation_dif->lang_value = $request->value;
                $translation_dif->save();
            }
        }
        return "success";
    }

    public function make_default_language(Request $request)
    {
        $request->validate([
            'default_language' => 'required|string|max:250',
        ]);

        $setting = Setting::where('type', 'default_language')->first();

        if (!$setting) {
            $setting = new Setting;
            $setting->id = Str::orderedUuid();
            $setting->type = 'default_language';
        }

        $setting->value = $request->default_language;
        $setting->save();

        return 'success';
    }

    public function get_default_language()
    {
        $setting = Setting::where('type', 'default_language')->first();
        $default_language = $setting->value ?? "US";
        $user_language = session('default_language') ?? $setting->value ?? "US"; //ES
        return $default_language;
    }
    public function translation_delete($id)
    {
        $translation = Translation::where('id', $id)->first();
        $translation->delete();
        return 'success';
    }

    public function languages_data()
    {
        return Language::pluck('name', 'code');
    }

    public function frontend_languages_data()
    {
        $languages =  Language::all();
        $setting = Setting::where('type', 'default_language')->first();
        $default_language = $setting->value ?? "US";
        $user_language = session('default_language') ?? $setting->value ?? "US"; //ES
        $lang_data = Translation::where('lang', $user_language)->pluck('lang_value', 'lang_key');
        return ['user_language' => $user_language,'lang_data' => $lang_data ,'languages' =>$languages ];

    }

    public function make_frontend_default_language(Request $request)
    { 
        $request->validate([
            'default_language' => 'required|string|max:250',
        ]);

        $language = Language::where('code', $request->default_language)->firstOrFail();

        if ($language) {
            session(['default_language' => $language->code]);
        }

        return 'success';
    }

}
