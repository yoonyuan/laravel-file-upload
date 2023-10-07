<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
    <style>
        td, th {
            border:1px solid black;
        }

        th {
            text-align:left;
        }
    </style>
</head>
<body>
    <h1>File Upload</h1>

    @if(session('success'))
        <div>{{ session('success') }}</div>
    @endif

    <form action="{{ route('file.upload') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <table style="width:50%;">
            <tr>
                <td><input type="file" name="file"></td>
                <td><button type="submit">Upload</button></td>
            </tr>
        </table>
    </form>

    <h2>Recent Uploads</h2>
    <table style="width:100%;">
        <tr>
            <th>Time</th>
            <th>File Name</th>
            <th>Status</th>
        </tr>
        @foreach($uploads as $upload)
        <tr>
            <td>
                <?php
                    $date1 = new DateTime($upload->start);
                    $date2 = new DateTime();
                    $interval = $date1->diff($date2);
                    $str = [];
                    if($interval->y>0){
                        $str[] = $interval->y. ' years';
                    }

                    if($interval->m>0){
                        $str[] = $interval->m. ' months';
                    }

                    if($interval->d>0){
                        $str[] = $interval->d. ' days';
                    }

                    if($interval->h>0){
                        $str[] = $interval->h. ' hours';
                    }

                    if($interval->i>0){
                        $str[] = $interval->i. ' minutes';
                    }

                    if($interval->s>0){
                        $str[] = $interval->s. ' seconds';
                    }
                ?>
                {{ $upload->start }}
                <br/>
                ({{ implode(" ",$str)." ago" }})
                <br/>
                <?php if(!empty($upload->end)){ ?>
                <?php
                    $date1 = new DateTime($upload->start);
                    $date2 = new DateTime($upload->end);
                    $interval = $date1->diff($date2);
                    $str = [];
                    if($interval->y>0){
                        $str[] = $interval->y. ' years';
                    }

                    if($interval->m>0){
                        $str[] = $interval->m. ' months';
                    }

                    if($interval->d>0){
                        $str[] = $interval->d. ' days';
                    }

                    if($interval->h>0){
                        $str[] = $interval->h. ' hours';
                    }

                    if($interval->i>0){
                        $str[] = $interval->i. ' minutes';
                    }

                    if($interval->s>0){
                        $str[] = $interval->s. ' seconds';
                    }
                ?>
                {{ "Time taken : ".implode(" ",$str) }}
                <?php } ?>
            </td>
            <td>{{ $upload->filename }}</td>
            <td>{{ $upload->status }}</td>
        </tr>
        @endforeach
    </table>
</body>
</html>
