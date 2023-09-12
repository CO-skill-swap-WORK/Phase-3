<x-app-layout>
    <x-slot name="header" >
    </x-slot>

    <link rel="stylesheet" href="{{asset('assets/css/tasks/create.css')}}">

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="formbold-main-wrapper" >
                <!-- Author: FormBold Team -->
                <!-- Learn More: https://formbold.com -->
                <div class="formbold-form-wrapper" style="margin-top: -50px">
                    <img src="{{asset('assets/img/final_ieee.png')}}" height="200" width="200" style="margin: auto ;margin-top: -25px">
                    <form action="{{route('tasks.store')}}" method="POST">
                        @csrf
                        <div>
                            <x-label for="title" value="{{ __('Title') }}" />
                            <x-input id="title" class="block mt-1 w-full @error('title') is-invalid @enderror" type="text" name="title" :value="old('title')" autofocus/>
                        </div>
                        @error('title')
                        <div class="alert alert-danger">
                            {{$message}}
                        </div>
                        @enderror
                                <div class="mt-4" >
                                    <x-label for="skill_id" value="{{ __('Skills') }}"/>
                                    <select name="skill_id" class="block mt-1 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm">
                                        @foreach(\App\Models\Skill::all() as $skill)
                                            <option value="{{$skill->id}}">{{$skill->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                        <div class="formbold-mb-3">
                            <label for="description" class="formbold-form-label">
                                Description
                            </label>
                            <textarea
                                rows="6"
                                name="description"
                                id="description"
                                class="formbold-form-input @error('description') is_invalid @enderror"
                           ></textarea>
                        </div>
                        @error('description')
                        <div class="alert alert-danger">
                            {{$message}}
                        </div>
                        @enderror

                                <div class="flex items-center justify-end mt-4">
                                    <x-button class="ml-4">
                                        {{ __('Done') }}
                                    </x-button>
                                </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
