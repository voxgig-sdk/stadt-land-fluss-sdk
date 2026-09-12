package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "StadtLandFluss",
			"slug": "stadt-land-fluss",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://slftool.github.io",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"data": map[string]any{},
			},
		},
		"entity": map[string]any{
			"data": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "beruf",
						"short": "List of professions",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "fluss",
						"short": "List of rivers",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "land",
						"short": "List of countries",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "marke",
						"short": "List of brands",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "name",
						"short": "List of names",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "pflanze",
						"short": "List of plants",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "stadt",
						"short": "List of German cities",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "tier",
						"short": "List of animals",
						"type": "`$ARRAY`",
					},
				},
				"name": "data",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/data.json",
								"segments": []any{
									map[string]any{
										"lit": "data.json",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"data.json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
