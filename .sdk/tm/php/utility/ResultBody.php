<?php
declare(strict_types=1);

// StadtLandFluss SDK utility: result_body

class StadtLandFlussResultBody
{
    public static function call(StadtLandFlussContext $ctx): ?StadtLandFlussResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
