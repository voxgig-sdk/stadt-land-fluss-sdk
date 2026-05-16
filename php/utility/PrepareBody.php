<?php
declare(strict_types=1);

// StadtLandFluss SDK utility: prepare_body

class StadtLandFlussPrepareBody
{
    public static function call(StadtLandFlussContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
