<x-app-layout>
    <x-slot name="header" style="z-index: 2">
    </x-slot>
    <link rel="stylesheet" href="{{asset('assets/css/tasks/create.css')}}">
    <div class="formbold-main-wrapper">
        <div class="formbold-form-wrapper">
            <img src="{{asset('assets/img/skills/question.png')}}" width="200" style="margin: auto;height: 150px">
            <form action="{{route('tasks.store')}}" method="POST">
                @csrf
                <div class="formbold-input-flex">
                    <div>
                        <label for="firstname" for="title" value="{{ __('Title') }}" class="formbold-form-label">Title</label>
                        <input id="title" class="formbold-form-input block mt-1 w-full @error('title') is-invalid @enderror" type="text" name="title" :value="old('title')" autofocus placeholder="Please Enter Ttile"/>
                    </div>
                </div>
                @error('title')
                <div class="alert alert-danger">
                    {{$message}}
                </div>
                @enderror

                <div class="formbold-input-radio-wrapper">
                    <label for="jobtitle" class="formbold-form-label"> What are you looking for? </label>

                    <div class="formbold-radio-group">
                        @foreach(\App\Models\Skill::all() as $skill)
                        <label class="" for="skill_id" value="{{ __('Skills') }}">
                         <input class="" type="radio" name="skill_id" id="jobtitle"  style="margin: 0px 12px;" value="{{$skill->id}}">{{$skill->name}}
                         <span class="formbold-radio-checkmark"></span>
                        </label>
                        @endforeach
                    </div>


                </div>

                <div class="formbold-mb-3">
                    <label for="message" class="formbold-form-label"> Description </label>
                    <textarea
                        rows="4"
                        name="description"
                        id="description"
                        class="formbold-form-input @error('description') is_invalid @enderror" placeholder="Write more Description"
                    style="margin-left: 22px"></textarea>

                </div>



                    <button class="formbold-btn">
                   Okey!
                </button>
            </form>
        </div>
    </div>
    </x-app-layout>


