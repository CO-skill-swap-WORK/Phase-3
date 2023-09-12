<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTask;
use App\Models\Task;
use App\Models\User;
use App\Notifications\CreateNewTask;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(){
        $user=Auth()->user();
        $tasks=Task::where('user_id',$user->id)->get();
        return view('customer.tasks.index',compact('tasks'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('customer.tasks.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTask $request)
    {
        $task=$request->all();
        // Validate the request data
        $user=Auth::user();
        $tasks=Task::where('user_id',$user->id)->get();
        // Create a new post
        $task= new Task();
        $task->title = $request->input('title');
        $task->description = $request->input('description');
        $task->skill_id=$request->input('skill_id');
        $task->user_id = auth()->user()->id; // Assuming you're using authentication
        $task->save();
        $users=User::where('id','!=',auth()->user()->id)->where('role_id','2')->where('skill_id',$task->skill_id)->get();
        $user_name=Auth::user()->name;
        Notification::send($users,new CreateNewTask($task->id,$user_name,$task->title));
        return view('customer.tasks.index',compact('tasks'));
    }


    public function show( $id)
    {
        $task=Task::findorFail($id);
        $getID=DB::table('notifications')->where('data->task_id',$id)->pluck('id');
        DB::table('notifications')->where('id',$getID)->update(['read_at' => Now()]);
        return view('customer.tasks.show',compact('task'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $task=Task::find($id);
        return view('customer.tasks.edit',compact('task'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $user=Auth::user();
        $tasks=Task::where('user_id',$user->id)->get();
        $task=Task::find($id);
        $task->title = $request->input('title');
        $task->description = $request->input('description');
        $task->skill_id=$request->input('skill_id');
        $task->save();
        return view('customer.tasks.index',compact('tasks'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
         Task::destroy($id);
         return redirect()->back();

    }
    public function markAsRead(){
        $user=User::find(auth()->user()->id);
        foreach ($user->unreadNotifications as $notification){
            $notification->markAsRead();
        }
        return redirect()->back();
    }
}
