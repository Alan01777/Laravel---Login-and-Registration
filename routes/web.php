<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthManager;
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


Route::get('/', [AuthManager::class, 'login'])->name('login');
Route::post('/', [AuthManager::class, 'loginPOST'])->name('login.post');

Route::get('/registration', [AuthManager::class, 'registration'])->name('registration');
Route::post('/registration', [AuthManager::class, 'registrationPOST'])->name('registration.post');

Route::get('/home', function () {
    return view('welcome');
})->name('home');

Route::get('/logout', [AuthManager::class, 'logout'])->name('logout');