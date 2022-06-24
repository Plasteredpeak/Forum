<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Middleware\Authenticate;
use App\Http\Middleware\isAdmin;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function __construct()
    {
        return $this->middleware([isAdmin::class, Authenticate::class]);
    }

    public function index()
    {
        return view('admin.dashboard.index');
    }
}
