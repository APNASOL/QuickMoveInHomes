<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Models\TourBooking;
use App\Models\TourCalendar;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class BookingController extends Controller
{

    public function booking_using_account($tour_id, $dates_id, $booking_code, $infants, $children, $adults, $price, $discount)
    {

        return view('app', compact('tour_id', 'dates_id', 'booking_code', 'infants', 'children', 'adults', 'price', 'discount'));
    }

    public function booking_using_registering_new_account(Request $request)
    {

        $request->validate([
            'user_name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|required_with:confirm_password|same:confirm_password|min:8',
            'confirm_password' => 'required|required_with:password|same:password',
        ]);
        $User = new User;
        $User->name = $request->user_name;
        $User->email = $request->email;
        $User->role = 'user';
        $User->password = Hash::make($request->password);
        $User->status = 1;
        $User->save();

        $welcome_email = Setting::where('type', 'welcome_email')->first();
        if ($welcome_email) {
            $decoded_welcome_email = json_decode($welcome_email->value) ?? "";
            $db_subject = $decoded_welcome_email[0]->subject ?? "";
            $db_description = $decoded_welcome_email[0]->description ?? "";
        } else {
            $db_subject = "";
            $db_description = "";
        }

        // Sending, dynamic email from the admin panel, genereated.

        $dynamic_email_descriptions_variables = ['[email]', '[password]'];
        $dynamic_email_descriptions_variables_data = [$User->email, $request->password];
        $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_variables, $dynamic_email_descriptions_variables_data, $db_description);

        $dataforEmail = [
            'account_create' => 'account_create',
            'dynamic_email_descriptions' => $adjusted_email_descriptions,
        ];

        $user_email = $request->email;
        $mail_subject = $db_subject;
        Mail::send('Emails.registerEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
            $message->to($user_email)->subject($mail_subject);
        });

        return 'verification-required';

    }

    public function booking_using_existing_account_login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if ($user) {
            if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                $user_verified = User::where('email', $request->email)->whereNotNull('email_verified_at')->first();
                if ($user_verified) {
                    return 'success';
                } else {
                    return 'verification-required';
                }

            } else {
                return response()->json([
                    'errors' => [
                        'email' => ['The provided credentials do not match our records.'],
                    ],
                    'message' => "The given data was invalid.",
                ], 422);
            }

        } else {

            $User = new User;
            $User->email = $request->email;
            $User->role = 'user';
            $User->name = strstr($request->email, '@', true);
            $User->password = Hash::make($request->password);
            $User->status = 1;
            $User->save();

            $welcome_email = Setting::where('type', 'welcome_email')->first();
            if ($welcome_email) {
                $decoded_welcome_email = json_decode($welcome_email->value) ?? "";
                $db_subject = $decoded_welcome_email[0]->subject ?? "";
                $db_description = $decoded_welcome_email[0]->description ?? "";
            } else {
                $db_subject = "";
                $db_description = "";
            }

            // Sending, dynamic email from the admin panel, genereated.

            $dynamic_email_descriptions_variables = ['[email]', '[password]'];
            $dynamic_email_descriptions_variables_data = [$User->email, $request->password];
            $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_variables, $dynamic_email_descriptions_variables_data, $db_description);

            $dataforEmail = [
                'account_create' => 'account_create',
                'dynamic_email_descriptions' => $adjusted_email_descriptions,
            ];

            $user_email = $request->email;
            $mail_subject = $db_subject;
            Mail::send('Emails.registerEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
                $message->to($user_email)->subject($mail_subject);
            });
            return 'verification-required';
        }

    }

    public function booking_using_email(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);
        $user = User::where('email', $request->email)->first();

        // if the entered email have no records then registered new account
        if (!$user) {
            $randomPassword = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 0, 8);

            $User = new User;
            $User->email = $request->email;
            $User->role = 'user';
            $User->name = strstr($request->email, '@', true);
            $User->password = Hash::make($randomPassword);
            $User->status = 1;
            $User->save();

            $welcome_email = Setting::where('type', 'welcome_email')->first();
            if ($welcome_email) {
                $decoded_welcome_email = json_decode($welcome_email->value) ?? "";
                $db_subject = $decoded_welcome_email[0]->subject ?? "";
                $db_description = $decoded_welcome_email[0]->description ?? "";
            } else {
                $db_subject = "";
                $db_description = "";
            }

            // Sending, dynamic email from the admin panel, genereated.

            $dynamic_email_descriptions_variables = ['[email]', '[password]'];
            $dynamic_email_descriptions_variables_data = [$User->email, $randomPassword];
            $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_variables, $dynamic_email_descriptions_variables_data, $db_description);

            $dataforEmail = [
                'account_create' => 'account_create',
                'dynamic_email_descriptions' => $adjusted_email_descriptions,
            ];

            $user_email = $request->email;
            $mail_subject = $db_subject;
            Mail::send('Emails.registerEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
                $message->to($user_email)->subject($mail_subject);
            });
        }

        return 'success';

    }

    public function front_end_apply_via_login($email, $tour_id, $dates_id, $booking_code, $infants, $children, $adults, $price, $discount)
    {
        // dd($price , $discount , 100);
        $discounted_amount = ($price * $discount) / 100;

        $response = null;
        $client_secret = null;
        $order_code = date('Ymd-His') . rand(10, 99);

        $stripe = new \Stripe\StripeClient(
            config('app.stripe_secret_key')
        );

        $response = $stripe->paymentIntents->create([
            'amount' => $discounted_amount * 100,
            'currency' => 'USD',
            'payment_method_types' => ['card'],
            'description' => 'Mediqmaq',
            'metadata' => [
                'order_code' => $order_code,
            ],
        ]);

        if ($response && $response->status == 'requires_payment_method') {
            $client_secret = $response->client_secret;
        }

        return redirect()->route('booking-payment-options', [
            'email' => $email,
            'tour_id' => $tour_id,
            'dates_id' => $dates_id,
            'booking_code' => $booking_code,
            'infants' => $infants,
            'children' => $children,
            'adults' => $adults,
            'price' => $price,
            'discount' => $discount,
            'final_amount' => $discounted_amount,
            'order_code' => $order_code,
            'client_secret' => $client_secret,

        ]);

    }

    public function boooking_payment_options($email, $tour_id, $dates_id, $booking_code, $infants, $children, $adults, $price, $discount, $final_amount, $order_code, $client_secret)
    {

        // Pass variables to the view using compact()
        return view('app', compact('email', 'tour_id', 'dates_id', 'booking_code', 'infants', 'children', 'adults', 'price', 'discount', 'final_amount', 'order_code', 'client_secret'));
    }

    public function order_place_with_stripe(Request $request)
    {
        
        $order_code = $request->query('order_code');
        $tour_id = $request->query('tour_id');
        $email = $request->query('email');
        $dates_id = $request->query('dates_id');
        $infants = $request->query('infants');
        $children = $request->query('children');
        $adults = $request->query('adults');
        $price = $request->query('price');
        $payment_intent = $request->query('payment_intent');

        // dd($order_code,$tour_id,$email,$dates_id,$infants,$children,$adults,$price);

        $user = User::where('email', $email)->first();

        $tour_calendar = TourCalendar::where('id', $dates_id)->first();
        if ($tour_calendar) {
            // Update the number of available infants, children, and adults
            $tour_calendar->infants -= $infants;
            $tour_calendar->children -= $children;
            $tour_calendar->adults -= $adults;
            // Save the updated record
            $tour_calendar->save();
        }
        
        $booking = new TourBooking;
        $booking->id = Str::orderedUuid();
        $booking->order_code = $order_code;
        $booking->tour_id = $tour_id;
        $booking->dates_id = $dates_id;
        $booking->user_id = $user->id;

        $booking->infants = $infants;
        $booking->children = $children;
        $booking->adults = $adults;
        $booking->amount = $price;
        $booking->stripe_payment_intent_id = $payment_intent;
        $booking->save();
        // dd($payment_intent);

        return redirect()->route('home');
        
    }

    public function order_place_with_paypal(Request $request, $price, $tour_id, $email, $dates_id, $infants, $children, $adults, $booking_code, $status, $payer_email, $payer_name, $payer_id, $transaction_id)
    {
        // dd($price, $tour_id, $email, $dates_id, $infants, $children, $adults, $booking_code, $status, $payer_email, $payer_name, $payer_id, $transaction_id);


        $user = User::where('email', $email)->first();

        $tour_calendar = TourCalendar::where('id', $dates_id)->first();
        if ($tour_calendar) {
            // Update the number of available infants, children, and adults
            $tour_calendar->infants -= $infants;
            $tour_calendar->children -= $children;
            $tour_calendar->adults -= $adults;
            // Save the updated record
            $tour_calendar->save();
        }
        $booking = new TourBooking;
        $booking->id = Str::orderedUuid();
        $booking->amount = $price;
        $booking->tour_id = $tour_id;
        $booking->dates_id = $dates_id;
        $booking->order_code = $booking_code;
        $booking->user_id = $user->id;
        $booking->transaction_id = $transaction_id;
        // dd($transaction_id);

        $booking->infants = $infants;
        $booking->children = $children;
        $booking->adults = $adults;
        $booking->save();
        return redirect()->route('home');
        // $message = ('Tour booked successfully');
        // return redirect()->route('home', [
        //     'message' => $message,
        // ]);
        
        
    }

}
