# StadtLandFluss SDK configuration


def make_config():
    return {
        "main": {
            "name": "StadtLandFluss",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://slftool.github.io",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "data": {},
            },
        },
        "entity": {
      "data": {
        "fields": [
          {
            "name": "beruf",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "fluss",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "land",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "marke",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "name",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "pflanze",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "stadt",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 6,
          },
          {
            "name": "tier",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 7,
          },
        ],
        "name": "data",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "method": "GET",
                "orig": "/data.json",
                "parts": [
                  "data.json",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
