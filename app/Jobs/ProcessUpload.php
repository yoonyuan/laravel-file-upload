<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Upload;
use Illuminate\Support\Facades\DB;

class ProcessUpload implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $upload;

    /**
     * Create a new job instance.
     */
    public function __construct($upload)
    {
        $this->upload = $upload;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $record = upload::find($this->upload->id);

        if ($record) {
            $record->status = 'Processing';
            $record->save();

            $csvFilePath = storage_path($record->path);
            $column = "`UNIQUE_KEY`, `PRODUCT_TITLE`, `PRODUCT_DESCRIPTION`, `STYLE#`, `AVAILABLE_SIZES`, `BRAND_LOGO_IMAGE`, `THUMBNAIL_IMAGE`, `COLOR_SWATCH_IMAGE`, `PRODUCT_IMAGE`, `SPEC_SHEET`, `PRICE_TEXT`, `SUGGESTED_PRICE`, `CATEGORY_NAME`, `SUBCATEGORY_NAME`, `COLOR_NAME`, `COLOR_SQUARE_IMAGE`, `COLOR_PRODUCT_IMAGE`, `COLOR_PRODUCT_IMAGE_THUMBNAIL`, `SIZE`, `QTY`, `PIECE_WEIGHT`, `PIECE_PRICE`, `DOZENS_PRICE`, `CASE_PRICE`, `PRICE_GROUP`, `CASE_SIZE`, `INVENTORY_KEY`, `SIZE_INDEX`, `SANMAR_MAINFRAME_COLOR`, `MILL`, `PRODUCT_STATUS`, `COMPANION_STYLES`, `MSRP`, `MAP_PRICING`, `FRONT_MODEL_IMAGE_URL`, `BACK_MODEL_IMAGE`, `FRONT_FLAT_IMAGE`, `BACK_FLAT_IMAGE`, `PRODUCT_MEASUREMENTS`, `PMS_COLOR`, `GTIN`";

            $time = time();
            $query = "create table temp_".$time." like temp";
            if(!DB::statement($query)){
                $record->status = 'Failed';
                $record->end = date('Y-m-d H:i:s');
                $record->save();
            }

            $tableName = 'temp_'.$time;
            $query = "LOAD DATA LOCAL INFILE '{$csvFilePath}' INTO TABLE {$tableName} FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES ({$column})";
            if(!DB::statement($query)){
                $record->status = 'Failed';
                $record->end = date('Y-m-d H:i:s');
                $record->save();
            }

            $query = "UPDATE {$tableName} SET `PRODUCT_TITLE` = CONVERT(`PRODUCT_TITLE` USING utf8mb4), `PRODUCT_DESCRIPTION` = CONVERT(`PRODUCT_DESCRIPTION` USING utf8mb4), `STYLE#` = CONVERT(`STYLE#` USING utf8mb4), `COLOR_NAME` = CONVERT(`COLOR_NAME` USING utf8mb4), `SIZE` = CONVERT(`SIZE` USING utf8mb4), `PIECE_PRICE` = CONVERT(`PIECE_PRICE` USING utf8mb4), `SANMAR_MAINFRAME_COLOR` = CONVERT(`SANMAR_MAINFRAME_COLOR` USING utf8mb4)";
            if(!DB::statement($query)){
                $record->status = 'Failed';
                $record->end = date('Y-m-d H:i:s');
                $record->save();
            }

            //NEW
            $query = "INSERT INTO `data` (`UNIQUE_KEY`, `PRODUCT_TITLE`, `PRODUCT_DESCRIPTION`, `STYLE#`, `COLOR_NAME`, `SIZE`, `PIECE_PRICE`, `SANMAR_MAINFRAME_COLOR`) SELECT `UNIQUE_KEY`, `PRODUCT_TITLE`, `PRODUCT_DESCRIPTION`, `STYLE#`, `COLOR_NAME`, `SIZE`, `PIECE_PRICE`, `SANMAR_MAINFRAME_COLOR` FROM {$tableName} WHERE NOT EXISTS (SELECT 1 FROM `data` WHERE `data`.UNIQUE_KEY = {$tableName}.UNIQUE_KEY) GROUP BY `UNIQUE_KEY`, `PRODUCT_TITLE`, `PRODUCT_DESCRIPTION`, `STYLE#`, `COLOR_NAME`, `SIZE`, `PIECE_PRICE`, `SANMAR_MAINFRAME_COLOR`;";
            if(!DB::statement($query)){
                $record->status = 'Failed';
                $record->end = date('Y-m-d H:i:s');
                $record->save();
            }

            //UPDATE
            $query = "UPDATE `data` a, {$tableName} b set a.`PRODUCT_TITLE` = b.`PRODUCT_TITLE`, a.`PRODUCT_DESCRIPTION` = b.`PRODUCT_DESCRIPTION`, a.`STYLE#` = b.`STYLE#`, a.`COLOR_NAME` = b.`COLOR_NAME`, a.`SIZE` = b.`SIZE`, a.`PIECE_PRICE` = b.`PIECE_PRICE`, a.`SANMAR_MAINFRAME_COLOR` = b.`SANMAR_MAINFRAME_COLOR` WHERE a.`UNIQUE_KEY` = b.`UNIQUE_KEY`";
            if(!DB::statement($query)){
                $record->status = 'Failed';
                $record->end = date('Y-m-d H:i:s');
                $record->save();
            }

            //DROP
            $query = "DROP TABLE {$tableName}";
            if(!DB::statement($query)){
                $record->status = 'Failed';
                $record->end = date('Y-m-d H:i:s');
                $record->save();
            }

            unlink($csvFilePath);

            $record->status = 'Completed';
            $record->end = date('Y-m-d H:i:s');
            $record->save();
        }
    }
}
