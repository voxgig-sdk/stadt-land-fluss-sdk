# StadtLandFluss SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
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
            "type": "`$ARRAY`",
          },
          {
            "name": "fluss",
            "type": "`$ARRAY`",
          },
          {
            "name": "land",
            "type": "`$ARRAY`",
          },
          {
            "name": "marke",
            "type": "`$ARRAY`",
          },
          {
            "name": "name",
            "type": "`$ARRAY`",
          },
          {
            "name": "pflanze",
            "type": "`$ARRAY`",
          },
          {
            "name": "stadt",
            "type": "`$ARRAY`",
          },
          {
            "name": "tier",
            "type": "`$ARRAY`",
          },
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
                  "data.json",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
