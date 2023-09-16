<?php

use App\Http\Controllers\LaraveliaController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RatingController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
//Main Page
Route::get('/', function () {
    return view('welcome');
})->name('welcome');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
// Register-step-2
Route::group(['middleware'=>['auth','verified']],function (){
    Route::group(['middleware'=>['registration-completed']],function (){
        Route::get('/dashboard', function () {
            return view('dashboard');
        })->name('dashboard');
    });
    //Register Step 2
    Route::get("register-step2",[\App\Http\Controllers\RegisterStepTwoController::class,'create'])
        ->name('register-step2.create');
    Route::post("register-step2",[\App\Http\Controllers\RegisterStepTwoController::class,'store'])
        ->name('register-step2.post');
});
//Role
Route::group(['middleware' => 'auth'], function() {
    Route::group(['middleware' => 'role:tasker', 'prefix' => 'tasker', 'as' => 'tasker.'], function() {
        Route::resource('notifications', \App\Http\Controllers\Tasker\NotificationController::class);
    });
    Route::group(['middleware' => 'role:customer', 'prefix' => 'customer', 'as' => 'customer.'], function() {
        Route::resource('tasks', \App\Http\Controllers\Customer\TaskController::class);
    });

    Route::get('ratings',[RatingController::class,'index'])->name('ratings');

});
//tasks CRUD
Route::resource('tasks', \App\Http\Controllers\Customer\TaskController::class);


//Stripe

Route::name('stripe.')
    ->controller(LaraveliaController::class)
    ->prefix('stripe')
    ->group(function () {
        Route::get('payment', 'index')->name('index');
        Route::post('payment', 'store')->name('store');
    });
//Notifications
Route::get('notification/markAsRead', [\App\Http\Controllers\Customer\TaskController::class,'markAsRead'])->name('markAsRead');

