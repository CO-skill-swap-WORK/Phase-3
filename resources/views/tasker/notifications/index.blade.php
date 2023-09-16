<link rel="stylesheet" href="{{ asset('assets/css/tasks/show.css') }}">
<x-app-layout>
    <x-slot name="header">
    </x-slot>

    @forelse(Auth::User()->unreadnotifications as $notification)
        <div id="screen">
            <div id="menubar">
                <div class="mac-btn" id="mac-btn-one"></div>
                <div class="mac-btn" id="mac-btn-two"></div>
                <div class="mac-btn" id="mac-btn-three"></div>
            </div>

            <div id="filler">
                <div id="profiler"><img src="{{ asset('assets/img/skills/cooker.jpg') }}"></div>
                <div id="intro">
                    <div class="filler-one">{{ $notification->data['user'] }}</div>
                    <div class="filler-one">{{ $notification->created_at }}</div>
                </div>

                <div id="main">
                    <div class="filler-two">{{ $notification->data['description'] }}</div>
                </div>
            </div>

            <div class="notification">
                <div class="content">
                    <div class="identifier"></div>
                    <div class="text"></div>
                </div>
            </div>

            <div class="number"><p>{{ $notification->data['task_id'] }}</p></div>
        </div>
        <div style="margin-top: -40px;margin-left: 700px"><a href="{{ route('tasks.show', $notification->data['task_id']) }}">Read Now!</a></div>
    @empty
        <div class="no-notifications">
            {{ __('No Notifications Yet') }}
        </div>
    @endforelse
</x-app-layout>
