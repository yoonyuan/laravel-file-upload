<?php

namespace App\Http\Controllers;

use App\Models\Upload;
use Illuminate\Http\Request;
use App\Jobs\ProcessUpload;


class FileUploadController extends Controller
{
    public function index()
    {
        $uploads = Upload::latest()->get();
        return view('index', compact('uploads'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:csv',
        ]);

        $file = $request->file('file');
        $filenameori = $file->getClientOriginalName();
        $filename = time() . '.' . $file->getClientOriginalExtension();
        $path = $file->storeAs('upload', $filename);

        $uploaded = Upload::create([
            'start' => date('Y-m-d H:i:s'),
            'path' => 'app/'.$path,
            'filename' => $filenameori,
        ]);

        ProcessUpload::dispatch($uploaded);

        return redirect()->back()->with('success', 'File uploaded successfully.');
    }
}
