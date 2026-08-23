
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'StadtLandFluss',
        slug: "stadt-land-fluss",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://slftool.github.io",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      data: {
      },

    }
  }


  entity = {
    "data": {
      "fields": [
        {
          "name": "beruf",
          "short": "List of professions",
          "type": "`$ARRAY`"
        },
        {
          "name": "fluss",
          "short": "List of rivers",
          "type": "`$ARRAY`"
        },
        {
          "name": "land",
          "short": "List of countries",
          "type": "`$ARRAY`"
        },
        {
          "name": "marke",
          "short": "List of brands",
          "type": "`$ARRAY`"
        },
        {
          "name": "name",
          "short": "List of names",
          "type": "`$ARRAY`"
        },
        {
          "name": "pflanze",
          "short": "List of plants",
          "type": "`$ARRAY`"
        },
        {
          "name": "stadt",
          "short": "List of German cities",
          "type": "`$ARRAY`"
        },
        {
          "name": "tier",
          "short": "List of animals",
          "type": "`$ARRAY`"
        }
      ],
      "name": "data",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/data.json",
              "parts": [
                "data.json"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

