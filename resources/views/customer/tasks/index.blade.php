<x-app-layout>
    <x-slot name="header">
    </x-slot>
    <link rel="stylesheet" href="{{ asset('assets/css/tasks/index.css') }}">
    <body>
    <div id="wrapper" style="margin-top: 100px">
        <h1>All Your Tasks</h1>

        @if ($tasks->isEmpty())
            <div class="no-post">{{__('No Posts Yet')}}</div>
        @else
            <table id="keywords" cellspacing="0" cellpadding="0">
                <thead>
                <tr>
                    <th><span>Task Id</span></th>
                    <th><span>Task Title</span></th>
                    <th><span>Date</span></th>
                    <th colspan="3"><span>Actions</span></th>
                </tr>
                </thead>
                <tbody>
                @foreach ($tasks as $task)
                    <tr>
                        <td>{{ $task->id }}</td>
                        <td>{{ $task->title }}</td>
                        <td>{{ $task->created_at }}</td>
                        <td>
                            <a href="{{ route('customer.tasks.show', $task->id) }}" class="btn btn-danger">View</a>
                        </td>
                        <td>
                            <a href="{{ route('customer.tasks.edit', $task->id) }}" class="btn btn-danger">Edit</a>
                        </td>
                        <td>
                            <form method="post" action="{{ route('customer.tasks.destroy', $task->id) }}">
                                @csrf
                                @method('delete')
                                <input type="submit" value="Delete">
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        @endif
    </div>
    </body>
</x-app-layout>
