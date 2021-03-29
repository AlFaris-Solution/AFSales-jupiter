<?php

namespace App\Http\Controllers\Admin;

use App\User;
use Spatie\Permission\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreUsersRequest;
use App\Http\Requests\Admin\UpdateUsersRequest;

use DB;
use DataTables;
use Session;
use Redirect;
use App\Gudang;
use App\Departement;


class UsersController extends Controller
{
    /**
     * Display a listing of User.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }

        $users = User::all()->where('username','!=','admin')->where('username','!=','master');

        return view('admin.users.index', compact('users'));
    }

    public function data()
    {
        $roles = DB::table('users')
                 ->join('model_has_roles','users.id', '=', 'model_has_roles.model_id')
                 ->join('roles','model_has_roles.role_id', '=', 'roles.id')
                 ->select('users.id','users.name','users.email', 'users.tlp', 'users.alamat', 'users.created_at', 'roles.name as roles', 'users.username')->where('username','!=','master')
                 ->orderBy('users.id', 'asc')
                 ->get();

        $no = 0;
        $data = array();

        foreach ($roles as $list) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $list->username;
            $row[] = $list->email;
            $row[] = $list->tlp;
            $row[] = $list->alamat;
            $row[] = $list->roles;
            $row[] = '
                    <div class="text-center btn-group btn-group-justified"><a href="'.route('admin.users.edit',[$list->id]).'" title="Edit" Onclick="return ConfirmEdit();"><button type="button" class="btn btn-sm btn-warning"><i class="fa fa-pencil"></i></button></a> <a href="users/delete/'.$list->id.'" title="Delete" Onclick="return ConfirmDelete();"><button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button></a></div>
            ';
            $data[] = $row;
        }

        $output = ['data' => $data];
        return response()->json($output);
    }

    public function findGudang(Request $request)
    {
        $data = Gudang::where('id', $request->id)->first();
        return response()->json($data);
    }

    public function findDep(Request $request)
    {
        $data = Departement::where('id', $request->id)->first();
        return response()->json($data);
    }

    /**
     * Show the form for creating new User.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }
        $roles = Role::get()->pluck('name', 'name');
        $kontak_list = Gudang::all();
        $dep_list = Departement::all();

        return view('admin.users.create', compact('roles','kontak_list','dep_list'));
    }

    /**
     * Store a newly created User in storage.
     *
     * @param  \App\Http\Requests\StoreUsersRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUsersRequest $request)
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }

        $user = User::create($request->all());
        $roles = $request->input('roles') ? $request->input('roles') : [];
        $user->assignRole($roles);

        return redirect()->route('admin.users.index');
    }


    /**
     * Show the form for editing User.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }
        $roles = Role::get()->pluck('name', 'name');
        $kontak_list = Gudang::all();
        $dep_list = Departement::all();


        $user = User::findOrFail($id);

        return view('admin.users.edit', compact('user', 'roles','kontak_list','dep_list'));
    }

    /**
     * Update User in storage.
     *
     * @param  \App\Http\Requests\UpdateUsersRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUsersRequest $request, $id)
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }
        $user = User::find($id);
        $user->update($request->all());
        $roles = $request->input('roles') ? $request->input('roles') : [];
        $user->syncRoles($roles);

        return redirect()->route('admin.users.index');
    }

    /**
     * Remove User from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }
        /*
        $user = User::findOrFail($id);
        $user->delete();

        return redirect()->route('admin.users.index');


        $permission = Uom::findOrFail($id);
        $permission->delete();
        return redirect()->route('users.index');
        */

        DB::table('users')->where('id', '=', $id)->delete();
        Session::flash('message', 'Data Berhasil Dihapus !!!');
        //return Redirect::to('admin/roles');
        return redirect()->route('admin.users.index');
    }

    /**
     * Delete all selected User at once.
     *
     * @param Request $request
     */
    public function massDestroy(Request $request)
    {
        if (! Gate::allows('Menu Pengaturan')) {
            return abort(403);
        }
        if ($request->input('ids')) {
            $entries = User::whereIn('id', $request->input('ids'))->get();

            foreach ($entries as $entry) {
                $entry->delete();
            }
        }
    }

}
