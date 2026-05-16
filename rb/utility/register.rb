# StadtLandFluss SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

StadtLandFlussUtility.registrar = ->(u) {
  u.clean = StadtLandFlussUtilities::Clean
  u.done = StadtLandFlussUtilities::Done
  u.make_error = StadtLandFlussUtilities::MakeError
  u.feature_add = StadtLandFlussUtilities::FeatureAdd
  u.feature_hook = StadtLandFlussUtilities::FeatureHook
  u.feature_init = StadtLandFlussUtilities::FeatureInit
  u.fetcher = StadtLandFlussUtilities::Fetcher
  u.make_fetch_def = StadtLandFlussUtilities::MakeFetchDef
  u.make_context = StadtLandFlussUtilities::MakeContext
  u.make_options = StadtLandFlussUtilities::MakeOptions
  u.make_request = StadtLandFlussUtilities::MakeRequest
  u.make_response = StadtLandFlussUtilities::MakeResponse
  u.make_result = StadtLandFlussUtilities::MakeResult
  u.make_point = StadtLandFlussUtilities::MakePoint
  u.make_spec = StadtLandFlussUtilities::MakeSpec
  u.make_url = StadtLandFlussUtilities::MakeUrl
  u.param = StadtLandFlussUtilities::Param
  u.prepare_auth = StadtLandFlussUtilities::PrepareAuth
  u.prepare_body = StadtLandFlussUtilities::PrepareBody
  u.prepare_headers = StadtLandFlussUtilities::PrepareHeaders
  u.prepare_method = StadtLandFlussUtilities::PrepareMethod
  u.prepare_params = StadtLandFlussUtilities::PrepareParams
  u.prepare_path = StadtLandFlussUtilities::PreparePath
  u.prepare_query = StadtLandFlussUtilities::PrepareQuery
  u.result_basic = StadtLandFlussUtilities::ResultBasic
  u.result_body = StadtLandFlussUtilities::ResultBody
  u.result_headers = StadtLandFlussUtilities::ResultHeaders
  u.transform_request = StadtLandFlussUtilities::TransformRequest
  u.transform_response = StadtLandFlussUtilities::TransformResponse
}
