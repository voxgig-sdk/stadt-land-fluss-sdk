<?php
declare(strict_types=1);

// StadtLandFluss SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

StadtLandFlussUtility::setRegistrar(function (StadtLandFlussUtility $u): void {
    $u->clean = [StadtLandFlussClean::class, 'call'];
    $u->done = [StadtLandFlussDone::class, 'call'];
    $u->make_error = [StadtLandFlussMakeError::class, 'call'];
    $u->feature_add = [StadtLandFlussFeatureAdd::class, 'call'];
    $u->feature_hook = [StadtLandFlussFeatureHook::class, 'call'];
    $u->feature_init = [StadtLandFlussFeatureInit::class, 'call'];
    $u->fetcher = [StadtLandFlussFetcher::class, 'call'];
    $u->make_fetch_def = [StadtLandFlussMakeFetchDef::class, 'call'];
    $u->make_context = [StadtLandFlussMakeContext::class, 'call'];
    $u->make_options = [StadtLandFlussMakeOptions::class, 'call'];
    $u->make_request = [StadtLandFlussMakeRequest::class, 'call'];
    $u->make_response = [StadtLandFlussMakeResponse::class, 'call'];
    $u->make_result = [StadtLandFlussMakeResult::class, 'call'];
    $u->make_point = [StadtLandFlussMakePoint::class, 'call'];
    $u->make_spec = [StadtLandFlussMakeSpec::class, 'call'];
    $u->make_url = [StadtLandFlussMakeUrl::class, 'call'];
    $u->param = [StadtLandFlussParam::class, 'call'];
    $u->prepare_auth = [StadtLandFlussPrepareAuth::class, 'call'];
    $u->prepare_body = [StadtLandFlussPrepareBody::class, 'call'];
    $u->prepare_headers = [StadtLandFlussPrepareHeaders::class, 'call'];
    $u->prepare_method = [StadtLandFlussPrepareMethod::class, 'call'];
    $u->prepare_params = [StadtLandFlussPrepareParams::class, 'call'];
    $u->prepare_path = [StadtLandFlussPreparePath::class, 'call'];
    $u->prepare_query = [StadtLandFlussPrepareQuery::class, 'call'];
    $u->result_basic = [StadtLandFlussResultBasic::class, 'call'];
    $u->result_body = [StadtLandFlussResultBody::class, 'call'];
    $u->result_headers = [StadtLandFlussResultHeaders::class, 'call'];
    $u->transform_request = [StadtLandFlussTransformRequest::class, 'call'];
    $u->transform_response = [StadtLandFlussTransformResponse::class, 'call'];
});
