<?php

namespace App\Http\Controllers\Tasker;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function index(){
        return view('tasker.notifications.index');
    }
}
