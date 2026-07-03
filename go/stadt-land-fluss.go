package voxgigstadtlandflusssdk

import (
	"github.com/voxgig-sdk/stadt-land-fluss-sdk/go/core"
	"github.com/voxgig-sdk/stadt-land-fluss-sdk/go/entity"
	"github.com/voxgig-sdk/stadt-land-fluss-sdk/go/feature"
	_ "github.com/voxgig-sdk/stadt-land-fluss-sdk/go/utility"
)

// Type aliases preserve external API.
type StadtLandFlussSDK = core.StadtLandFlussSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type StadtLandFlussEntity = core.StadtLandFlussEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type StadtLandFlussError = core.StadtLandFlussError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewDataEntityFunc = func(client *core.StadtLandFlussSDK, entopts map[string]any) core.StadtLandFlussEntity {
		return entity.NewDataEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewStadtLandFlussSDK = core.NewStadtLandFlussSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewStadtLandFlussSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *StadtLandFlussSDK  { return NewStadtLandFlussSDK(nil) }
func Test() *StadtLandFlussSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
