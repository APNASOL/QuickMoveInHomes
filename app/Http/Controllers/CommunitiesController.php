<?php

namespace App\Http\Controllers;

use App\Models\Amenity;
use App\Models\Community;
use App\Models\CommunityAmenity;
use App\Models\CommunityLasVegasRegion;
use App\Models\CommunityNeighborhood;
use App\Models\LasVegasRegion;
use App\Models\HOA;
use App\Models\Neighborhood;
use App\Models\Upload;
use App\Models\Property;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class CommunitiesController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }
    

    public function fetchCommunities(Request $request)
    {
        $communities = DB::table('communities');

        if ($request->name !== null && $request->name !== "null") {
            $communities->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }

        $communities = $communities->paginate(15);
        foreach ($communities as $community) {
            if ($community && $community->main_image) {

                $uploaded_image = Upload::where('id', $community->main_image)->first();
                if ($uploaded_image && $uploaded_image->file_name) {
                    $community->main_image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $communities;
    }

    public function create()
    {
        $name = 'create';
        return view('app', compact('name'));
    }

    public function store(Request $request)
    { 
        
        $validatedData = $request->validate([
            'community_id' => 'nullable|string',
            'name' => 'required|string|max:255',
            'latitude' => 'required',
            'longitude' => 'required',
            'description' => 'required|string|max:170',
            'location' => 'required|string',
            'hoa_id' => 'required|string',
            'map_location' => 'required|string',
            'legal_subdivision' => 'required|string',
            'nearby_properties' => 'required|string',
            'masterplan' => 'required|string',
            'sub_association' => 'required|string',
            'cic' => 'required|string',
            'lid' => 'required|string',
            'cid' => 'required|string',
            'sid_lid_fee' => 'required|numeric',
            'sid_lid_payment_frequency' => 'required|string',
            'proximity_to_strip' => 'required|numeric',
            'proximity_to_airport' => 'required|numeric',
            'nearby_attractions' => 'required|string',
            'main_image' => 'nullable',
            'regions' => 'nullable',
            'neighborhood' => 'nullable',
            'amenities' => 'nullable',
        ]);
        
        // Create or update a new Community instance
 
        if ($request->id) {
            $community = Community::where('id', $request->id)->first();
        } else {
            $community = new Community();
            $community->id = Str::orderedUuid();
        }

        $community->fill($validatedData);

        // Save the community data before related records
        $community->save();

        // Handle regions
        if ($request->regions) {
            CommunityLasVegasRegion::where('community_id', $community->id)->delete();
            $requested_regions = json_decode($request->regions);

            foreach ($requested_regions as $region) {
                $region_record = new CommunityLasVegasRegion();
                $region_record->id = Str::orderedUuid();
                $region_record->community_id = $community->id; // Use the new community ID
                $region_record->las_vegas_regions_id = $region;
                $region_record->save();
            }
        }

        // Handle neighborhoods
        if ($request->neighborhood) {
            CommunityNeighborhood::where('community_id', $community->id)->delete();
             
            $requested_neighborhoods = json_decode($request->neighborhood);

            foreach ($requested_neighborhoods as $neighborhood) {
                $neighborhood_record = new CommunityNeighborhood();
                $neighborhood_record->id = Str::orderedUuid();
                $neighborhood_record->community_id = $community->id; // Use the new community ID
                $neighborhood_record->neighborhood_id = $neighborhood;
                $neighborhood_record->save();
            }
        }

        // Handle amenities
        if ($request->amenities) {
            CommunityAmenity::where('community_id', $community->id)->delete();
            $requested_amenities = json_decode($request->amenities);

            foreach ($requested_amenities as $amenity) {
                $amenity_record = new CommunityAmenity();
                $amenity_record->id = Str::orderedUuid();
                $amenity_record->community_id = $community->id; // Use the new community ID
                $amenity_record->amenity_id = $amenity;
                $amenity_record->save();
            }
        }

        // Handle file uploads
        if ($request->file('files')) {
            $files_ids = [];
            
            // If there are existing file IDs in the community, decode them
            if ($community->files) {
                $existing_files_ids = json_decode($community->files, true);
            } else {
                $existing_files_ids = [];
            }
        
            // Loop through new files and add their IDs
            foreach ($request->file('files') as $file) {
                $file_name_with_path = $file->store('real_public/CommunitiesFiles/');
        
                $upload = new Upload();
                $upload->file_original_name = $file->getClientOriginalName();
                $upload->file_name = $file_name_with_path;
                $upload->file_size = $file->getSize();
                $upload->extension = $file->extension();
                $upload->type = $file->getClientMimeType();
                $upload->save();
        
                $files_ids[] = $upload->id;
            }
        
            // Merge the new file IDs with the existing ones
            $all_files_ids = array_merge($existing_files_ids, $files_ids);
            
            // Save the updated file IDs as a JSON string
            $community->files = json_encode($all_files_ids);
            $community->save();
        }
        
        
        if ($request->main_image) {

            $existingInUploads = Upload::where('id', $community->main_image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->main_image, strpos($request->main_image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/CommunityMainImages/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $community->main_image = $Upload->id;
        }
        $community->save(); // Save the community again if you added files
 
        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function getCommunity($id)
    {

        $community = Community::findOrFail($id);
        if ($community && $community->main_image) {
            $uploaded_image = Upload::where('id', $community->main_image)->first();

            if ($uploaded_image) {
                $community->main_image = get_storage_url($uploaded_image->file_name);
            }
        }
        $community->status = ($community->status == 1) ? true : false;

        if ($community && $community->main_image) {
            $uploaded_image = Upload::where('id', $community->main_image)->first();

            if ($uploaded_image) {
                $community->main_image = get_storage_url($uploaded_image->file_name);
            }
        }

        $CommunityAmenities = CommunityAmenity::where('community_id', $id)->pluck('amenity_id');
        if ($CommunityAmenities) {
            $community->amenites = $CommunityAmenities;
        }
        $CommunityRegions = CommunityLasVegasRegion::where('community_id', $id)->pluck('las_vegas_regions_id');
        if ($CommunityRegions) {
            $community->regions = $CommunityRegions;
        }
        $CommunityNeighborhoods = CommunityNeighborhood::where('community_id', $id)->pluck('neighborhood_id');
        if ($CommunityNeighborhoods) {
            $community->neighborhood = $CommunityNeighborhoods;
        }

        return $community;
    }

    public function details($id)
    {
        return view('app', compact('id'));
    }
    public function getCommunityDetails($id)
    {
        // Get the community
        $community = Community::find($id);
        if (!$community) {
            return response()->json(['message' => 'Community not found'], 404);
        }

        // Get amenities
        $communityAmenities = CommunityAmenity::where('community_id', $id)->pluck('amenity_id');
        if ($communityAmenities->isNotEmpty()) {
            $community->amenities = Amenity::whereIn('id', $communityAmenities)->pluck('name');
        } else {
            $community->amenities = [];
        }

        $hoa = HOA::where('id',$community->hoa_id)->first();
        if($hoa)
        {
            $community->hoa = $hoa->name; 
        }
        // Get regions
        $communityRegions = CommunityLasVegasRegion::where('community_id', $id)->pluck('las_vegas_regions_id');
        if ($communityRegions->isNotEmpty()) {
            $community->regions = LasVegasRegion::whereIn('id', $communityRegions)->pluck('name');
        } else {
            $community->regions = [];
        }

        // Get neighborhoods
        $communityNeighborhoods = CommunityNeighborhood::where('community_id', $id)->pluck('neighborhood_id');
        if ($communityNeighborhoods->isNotEmpty()) {
            $community->neighborhoods = Neighborhood::whereIn('id', $communityNeighborhoods)->pluck('name');
        } else {
            $community->neighborhoods = [];
        } 

        if ($community && $community->main_image) {
            $uploaded_image = Upload::where('id', $community->main_image)->first();

            if ($uploaded_image) {
                $community->main_image = get_storage_url($uploaded_image->file_name);
            }
        }

        if ($community->files) {

            $uploads = Upload::whereIn('id', json_decode($community->files))->orderBy('extension')->get(['id','file_original_name', 'file_name', 'extension', 'type']);
            $more_info_files = [];
            $more_info_images = [];
            $more_info_videos = [];
            foreach ($uploads as $key => $upload) {
                if (preg_match("/image/", $upload->type)) {
                    $upload['file_name'] = $upload['file_name'] ? get_storage_url($upload['file_name']) : '';
                    $more_info_images[] = $upload;
                } else if (preg_match("/video/", $upload->type)) {

                    $upload['file_name'] = $upload['file_name'] ? get_storage_url($upload['file_name']) : '';
                    $more_info_videos[] = $upload;
                } else {
                    $upload['file_name'] = $upload['file_name'] ? get_storage_url($upload['file_name']) : '';
                    $more_info_files[] = $upload;
                }

            }
             
            $community->files = $uploads;

        }

        // Return the community details with related records
        return $community;
    }

    public function delete($id)
{
    $community = Community::findOrFail($id);

    // Check for associations with other modules
    $property = Property::where('community_id', $id)->exists();
    $lasVegasRegion = CommunityLasVegasRegion::where('community_id', $community->id)->exists();
    $neighborhood = CommunityNeighborhood::where('community_id', $community->id)->exists();
    $amenity = CommunityAmenity::where('community_id', $community->id)->exists();

    // If any associations exist, return an error with a specific message
    if ($property || $lasVegasRegion || $neighborhood || $amenity) {
        $message = 'This community cannot be deleted because:';
        $reasons = [];

        if ($property) {
            $reasons[] = 'it is associated with one or more properties';
        }

        if ($lasVegasRegion) {
            $reasons[] = 'it is associated with one or more Regions';
        }

        if ($neighborhood) {
            $reasons[] = 'it is associated with one or more neighborhoods';
        }

        if ($amenity) {
            $reasons[] = 'it is associated with one or more amenities';
        }

        // Combine the reasons into a single message
        $message .= ' ' . implode(' and ', $reasons) . '. Please remove these associations before proceeding.';

        return response()->json([
            'status' => 'error',
            'message' => $message
        ], 400);
    }

    // Delete associated image if exists
    $upload = Upload::where('id', $community->image)->first();
    if ($upload) {
        Storage::delete($upload->file_name);
        $upload->delete();
    }

    // Delete the community
    $community->delete();

    return 'success';
}


    public function communities_pluck()
    {
        return Community::pluck('name', 'id');
    }
    public function community_photo_delete($id, $community_id)
    {

        $merged_id = [];
        $community = Community::findOrFail($community_id);

        if ($community->files) {
            $merged_id = array_values(array_diff(json_decode($community->files), array($id)));
        }

        $community->files = json_encode($merged_id);

        $community->save();
        $upload = Upload::where('id', $id)->first();

        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        return 'success';
    }

}
