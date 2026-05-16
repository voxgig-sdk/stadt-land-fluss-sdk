<?php
declare(strict_types=1);

// StadtLandFluss SDK utility: result_headers

class StadtLandFlussResultHeaders
{
    public static function call(StadtLandFlussContext $ctx): ?StadtLandFlussResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
