package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewDataEntityFunc func(client *StadtLandFlussSDK, entopts map[string]any) StadtLandFlussEntity

