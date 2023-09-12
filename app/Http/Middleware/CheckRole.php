<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, string $role): Response
    {
        if ($role == 'tasker' && auth()->user()->role_id != 2) {
            abort(403);
        }

        if ($role == 'customer' && auth()->user()->role_id != 3) {
            abort(403);
        }
        return $next($request);
    }
}
