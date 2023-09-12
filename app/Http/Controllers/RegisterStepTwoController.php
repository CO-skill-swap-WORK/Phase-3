<?php

namespace App\Http\Controllers;

use App\Models\Skill;
use Illuminate\Http\Request;

class RegisterStepTwoController extends Controller
{
    public function create(){
        $skills=Skill::all();
      return view('auth.register-step2',compact('skills'));
    }
    public function store(Request $request){
      auth()->user()->update([
          'national_number'=>$request->national_number,
          'phone' => $request->phone,
          'role_id' => $request->role_id,
          'skill_id' => $request->skill_id,

      ]);
      return redirect('dashboard');
    }
}
