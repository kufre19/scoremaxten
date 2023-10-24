<?php

namespace App\Http\Controllers\Maintainer;

use App\Http\Controllers\Controller;
use App\Models\NoticeBoard;
use App\Models\Notification;
use App\Models\Property;
use App\Models\Ticket;
use App\Services\PropertyService;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public $propertyService;

    public function __construct()
    {
        $this->propertyService = new PropertyService;
    }
    public function dashboard()
    {
        $data['pageTitle'] = __('Dashboard');
        $authUser = auth()->user();
        $data['properties'] = Property::where('owner_user_id', $authUser->owner_user_id)->get();
        $data['totalOpenTickets'] = Ticket::query()->whereIn('property_id', $authUser->maintainer->properties->pluck('id')->toArray())->where('status', TICKET_STATUS_OPEN)->count();
        $data['totalResolvedTickets'] = Ticket::query()->whereIn('property_id', $authUser->maintainer->properties->pluck('id')->toArray())->where('status', TICKET_STATUS_RESOLVED)->count();
        $data['totalCloseTickets'] = Ticket::query()->whereIn('property_id', $authUser->maintainer->properties->pluck('id')->toArray())->where('status', TICKET_STATUS_CLOSE)->count();
        $data['today'] = date('Y-m-d');
        $data['notices'] = NoticeBoard::whereIn('property_id', $authUser->maintainer->properties->pluck('id')->toArray())->where('start_date', '<=', $data['today'])->where('end_date', '>=', $data['today'])->limit(10)->get();
        $data['tickets'] = Ticket::whereIn('property_id', $authUser->maintainer->properties->pluck('id')->toArray())->limit(10)->get();
        return view('maintainer.dashboard')->with($data);
    }

    public function notification()
    {
        $data['pageTitle'] = __('Notification');
        Notification::query()
            ->where(function ($q) {
                $q->where('notifications.user_id', auth()->id())
                    ->orWhere('notifications.user_id', null);
            })
            ->update(['is_seen' => ACTIVE]);
        return view('maintainer.notification')->with($data);
    }

    public function allProperty(Request $request)
    {
        $data['pageTitle'] = __("All Property");
        $data['navPropertyMMShowClass'] = 'mm-show';
        $data['subNavAllPropertyMMActiveClass'] = 'mm-active';
        $data['subNavAllPropertyActiveClass'] = 'active';
        $data['properties'] = $this->propertyService->getAllForLandlord();
        if ($request->ajax()) {
            return $this->propertyService->getAllDataForLandlord();
        }
        return view('maintainer.property.all-property-list')->with($data);
    }

    
    public function showProperty($id)
    {
        $data['pageTitle'] = __("Property Details");
        $data['navPropertyMMShowClass'] = 'mm-show';
        $data['subNavAllPropertyMMActiveClass'] = 'mm-active';
        $data['subNavAllPropertyActiveClass'] = 'active';
        $data['property'] = $this->propertyService->getDetailsByIdForLandLord($id);
        $data['units'] = $this->propertyService->getUnitsByPropertyId($id)->getData()->data;
        return view('maintainer.property.show')->with($data);
    }
}
