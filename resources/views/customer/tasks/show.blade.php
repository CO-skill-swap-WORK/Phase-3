<x-app-layout>
    <x-slot name="header">
    </x-slot>
    <link rel="stylesheet" href="{{asset('assets/css/tasks/show.css')}}">
    <div class="container">
        <div class="card">
            <div class="card__body">
                <span class="tag tag-blue">{{ $task->id}}</span>
                <h4>{{$task->title}}</h4>
                <p>{{$task->description}}</p>
            </div>
            <div class="card__footer">
                <div class="user">
                    <img src="{{asset('assets/img/profile.jpg')}}" alt="user__image" class="user__image" height="50" width="50" style="border-radius: 50%">
                    <div class="user__info">
                        <h5>{{ $task->user->name }}</h5>
                        <small>{{$task->created_at}}</small>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</x-app-layout>
