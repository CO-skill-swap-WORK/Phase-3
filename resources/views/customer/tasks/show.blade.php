<x-app-layout>
    <x-slot name="header">
    </x-slot>
    <link rel="stylesheet" href="{{asset('assets/css/tasks/show.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/tasks/show.css')}}">
    <div id="screen">
        <div id="menubar">
            <div class="mac-btn" id="mac-btn-one"></div>
            <div class="mac-btn" id="mac-btn-two"></div>
            <div class="mac-btn" id="mac-btn-three"></div>
        </div>

        <div id="filler">
            <div id="profiler"><img src="{{asset('assets/img/skills/cooker.jpg')}}"></div>
            <div id="intro">
                <div class="filler-one">{{$task->title}}</div>
                <div class="filler-one">{{$task->created_at}}</div>

            </div>

            <div id="main">
                <div class="filler-two">{{$task->description}}</div>
            </div>
        </div>

        <div class="notification">
            <div class="content">
                <div class="identifier"></div>
                <div class="text"></div>
            </div>
        </div>

        <div class="number"><p>{{$task->id}}</p></div>
    </div>
</x-app-layout>
