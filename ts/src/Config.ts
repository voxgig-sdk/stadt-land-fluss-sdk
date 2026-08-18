
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


  main = {
    name: 'StadtLandFluss',
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
          "type": "`$ARRAY`"
        },
        {
          "name": "fluss",
          "type": "`$ARRAY`"
        },
        {
          "name": "land",
          "type": "`$ARRAY`"
        },
        {
          "name": "marke",
          "type": "`$ARRAY`"
        },
        {
          "name": "name",
          "type": "`$ARRAY`"
        },
        {
          "name": "pflanze",
          "type": "`$ARRAY`"
        },
        {
          "name": "stadt",
          "type": "`$ARRAY`"
        },
        {
          "name": "tier",
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

