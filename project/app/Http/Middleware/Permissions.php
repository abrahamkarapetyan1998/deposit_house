<?php

namespace App\Http\Middleware;
use Auth;
use Closure;

class Permissions
{

    public function handle($request, Closure $next,$data)
    {
        if (Auth::guard('admin')->check()) {
            if(Auth::guard('admin')->user()->id == 1){
                return $next($request);
            }
            if(Auth::guard('admin')->user()->role_id == 0){
                return redirect()->route('admin.staff.dashboard')->with('unsuccess',"You don't have access to that section"); 
            }
            if (Auth::guard('admin')->user()->sectionCheck($data)){
                return $next($request);
            }
        }

        $sections = explode(" , ", Auth::guard('admin')->user()->role->section);
        if (in_array('dashboard', $sections)){
            return redirect()->route('admin.dashboard')->with('unsuccess',"You don't have access to that section"); 
        }else{
            return redirect()->route('admin.staff.dashboard')->with('unsuccess',"You don't have access to that section"); 
           
        }

       
    }
}
