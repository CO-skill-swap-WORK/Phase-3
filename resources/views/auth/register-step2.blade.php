
<x-guest-layout>
    <x-authentication-card>
        <x-slot name="logo">
            <x-authentication-card-logo />
        </x-slot>

        <x-validation-errors class="mb-4" />

        <form method="POST" action="{{ route('register-step2.post') }}" x-data="{role_id: 2}">
            @csrf
            <div class="mt-4">
                <x-label for="national_number" value="{{ __('National Number') }}" />
                <x-input id="national_number" class="block mt-1 w-full" type="text" name="national_number" :value="old('national_number')" autofocus />
            </div>
            <div>
                <x-label for="phone" value="{{ __('Phone') }}" />
                <x-input id="phone" class="block mt-1 w-full" type="text" name="phone" :value="old('phone')" autofocus/>
            </div>
            <div class="mt-4">
                <x-label for="role_id" value="{{ __('Register as:') }}" />
                <select name="role_id" x-model="role_id" class="block mt-1 w-full border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm">
                    <option value="2">Tasker</option>
                    <option value="3">Customer</option>
                </select>
            </div>
            <div class="mt-4" x-show="role_id == 2">
                <x-label for="skill_id" value="{{ __('Skills') }}"/>
                <select name="skill_id" class="block mt-1 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm">
                    @foreach($skills as $skill)
                    <option value="{{$skill->id}}">{{$skill->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="flex items-center justify-end mt-4">
                <x-button class="ml-4">
                    {{ __('Finish Register') }}
                </x-button>
            </div>
        </form>
    </x-authentication-card>
</x-guest-layout>
