# StadtLandFluss SDK

German Stadt-Land-Fluss word database delivered as a single JSON file, organised alphabetically by first letter

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Stadt Land Fluss

Stadt Land Fluss is a community-maintained word database for the classic German party game *Stadt-Land-Fluss* (City, Country, River). It is published as a static JSON file by the [slftool](https://github.com/slftool) project and served from GitHub Pages at [slftool.github.io](https://slftool.github.io).

What you get from the API:

- A single `GET https://slftool.github.io/data.json` endpoint returning the full database in JSON.
- Word lists across the standard categories: Stadt (city), Land (country), Fluss (river), Name (first name), Beruf (profession), Tier (animal), Marke (brand) and Pflanze (plant).
- Entries organised alphabetically by first letter so you can pick valid answers for any round.

The service is a static file hosted on GitHub Pages: there is no authentication, no API key, and CORS is enabled so it can be fetched directly from a browser. Because it is a single JSON document, the recommended pattern is to fetch once and cache locally. Contributions and additional words are accepted via GitHub issues on the upstream repository.

## Try it

**TypeScript**
```bash
npm install stadt-land-fluss
```

**Python**
```bash
pip install stadt-land-fluss-sdk
```

**PHP**
```bash
composer require voxgig/stadt-land-fluss-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/stadt-land-fluss-sdk/go
```

**Ruby**
```bash
gem install stadt-land-fluss-sdk
```

**Lua**
```bash
luarocks install stadt-land-fluss-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { StadtLandFlussSDK } from 'stadt-land-fluss'

const client = new StadtLandFlussSDK({})

// List all datas
const datas = await client.Data().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o stadt-land-fluss-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "stadt-land-fluss": {
      "command": "/abs/path/to/stadt-land-fluss-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Data** | The full Stadt-Land-Fluss word database, returned by `GET /data.json` as a single JSON document containing word lists for each game category (Stadt, Land, Fluss, Name, Beruf, Tier, Marke, Pflanze) keyed by first letter. | `/data.json` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from stadtlandfluss_sdk import StadtLandFlussSDK

client = StadtLandFlussSDK({})

# List all datas
datas, err = client.Data(None).list(None, None)
```

### PHP

```php
<?php
require_once 'stadtlandfluss_sdk.php';

$client = new StadtLandFlussSDK([]);

// List all datas
[$datas, $err] = $client->Data(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/stadt-land-fluss-sdk/go"

client := sdk.NewStadtLandFlussSDK(map[string]any{})

// List all datas
datas, err := client.Data(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "StadtLandFluss_sdk"

client = StadtLandFlussSDK.new({})

# List all datas
datas, err = client.Data(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("stadt-land-fluss_sdk")

local client = sdk.new({})

-- List all datas
local datas, err = client:Data(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = StadtLandFlussSDK.test()
const result = await client.Data().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = StadtLandFlussSDK.test(None, None)
result, err = client.Data(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = StadtLandFlussSDK::test(null, null);
[$result, $err] = $client->Data(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Data(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = StadtLandFlussSDK.test(nil, nil)
result, err = client.Data(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Data(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Stadt Land Fluss

- Upstream: [https://slftool.github.io](https://slftool.github.io)
- API docs: [https://github.com/slftool/slftool.github.io](https://github.com/slftool/slftool.github.io)

- Released under the MIT License.
- You may use the database for your own purposes, including commercial use, subject to MIT terms.
- Attribution to the upstream `slftool` project is appreciated.
- No warranty is provided for completeness or accuracy of word entries.

---

Generated from the Stadt Land Fluss OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
