<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRegistrationCompletedMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if(is_null(auth()->user()->national_number) &&
            is_null(auth()->user()->phone) &&
            is_null(auth()->user()->skill_id) &&
            is_null(auth()->user()->role_id)){
            return redirect()->route('register-step2.create');
        }
        return $next($request);
    }
}
