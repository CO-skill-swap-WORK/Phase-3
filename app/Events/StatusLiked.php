<?php


namespace App\Events;

use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class StatusLiked implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $username;

    public $message;


    public function __construct($username)
    {
        $this->username = $username;
        $this->message  = "{$username} liked your status";
    }


    public function broadcastOn(){
        return ['status-liked'];}
    public function broadcastAs() {

        return 'event-name';

    }
}
