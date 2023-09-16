<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CreateNewTask extends Notification
{
    use Queueable;
    private $task_id;
    private $user;
    private $title;
    private $description;
    public function __construct($task_id,$user,$title,$description)
    {
        $this->task_id=$task_id;
        $this->user=$user;
        $this->title=$title;
        $this->description=$description;
    }
    public function via($notifiable)
    {
        return ['database'];
    }
    public function toArray(object $notifiable): array
    {
        return [
            'task_id'=>$this->task_id,
            'user' => $this->user,
            'title'=>$this->title,
            'description' => $this->description
        ];
    }
}
