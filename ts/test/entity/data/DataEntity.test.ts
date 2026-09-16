

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { StadtLandFlussSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('DataEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when STADT_LAND_FLUSS_TEST_LIVE=TRUE.
  afterEach(liveDelay('STADT_LAND_FLUSS_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = StadtLandFlussSDK.test()
    const ent = testsdk.Data()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.STADT_LAND_FLUSS_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'data.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"beruf","req":false,"short":"List of professions","type":"`$ARRAY`","index$":0},{"active":true,"name":"fluss","req":false,"short":"List of rivers","type":"`$ARRAY`","index$":1},{"active":true,"name":"land","req":false,"short":"List of countries","type":"`$ARRAY`","index$":2},{"active":true,"name":"marke","req":false,"short":"List of brands","type":"`$ARRAY`","index$":3},{"active":true,"name":"name","req":false,"short":"List of names","type":"`$ARRAY`","index$":4},{"active":true,"name":"pflanze","req":false,"short":"List of plants","type":"`$ARRAY`","index$":5},{"active":true,"name":"stadt","req":false,"short":"List of German cities","type":"`$ARRAY`","index$":6},{"active":true,"name":"tier","req":false,"short":"List of animals","type":"`$ARRAY`","index$":7}],"name":"data","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{},"contract":{"id":"GET /data.json","json":"{\"operationId\":\"getDatabase\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"example\":{\"beruf\":[\"Arzt\",\"Lehrer\",\"Ingenieur\"],\"fluss\":[\"Rhein\",\"Donau\",\"Elbe\"],\"land\":[\"Deutschland\",\"Österreich\",\"Schweiz\"],\"marke\":[\"BMW\",\"Mercedes\",\"Adidas\"],\"name\":[\"Anna\",\"Max\",\"Sophie\"],\"pflanze\":[\"Rose\",\"Tulpe\",\"Baum\"],\"stadt\":[\"Berlin\",\"München\",\"Hamburg\"],\"tier\":[\"Hund\",\"Katze\",\"Elefant\"]},\"schema\":{\"description\":\"Complete database of German words categorized for Stadt Land Fluss game\",\"properties\":{\"beruf\":{\"description\":\"List of professions\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"fluss\":{\"description\":\"List of rivers\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"land\":{\"description\":\"List of countries\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"marke\":{\"description\":\"List of brands\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"name\":{\"description\":\"List of names\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"pflanze\":{\"description\":\"List of plants\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"stadt\":{\"description\":\"List of German cities\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"tier\":{\"description\":\"List of animals\",\"items\":{\"type\":\"string\"},\"type\":\"array\"}},\"type\":\"object\"}}},\"description\":\"Successful response with the complete word database\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error response\",\"properties\":{\"code\":{\"description\":\"Error code\",\"type\":\"integer\"},\"error\":{\"description\":\"Error message\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Database not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error response\",\"properties\":{\"code\":{\"description\":\"Error code\",\"type\":\"integer\"},\"error\":{\"description\":\"Error message\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/data.json","segments":[{"lit":"data.json"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"data","name__orig":"data","Name":"Data","name_":"data","name-":"data","NAME":"DATA","index$":0}, {"active":true,"entity":"data","key$":"BasicDataFlow","kind":"basic","name":"BasicDataFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"data_ref01"}}],"index$":0}]}, 'Data')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let data_ref01_data = Object.values(setup.data.existing.data)[0] as any

    // LIST
    const data_ref01_ent = client.Data()
    const data_ref01_match: any = {}

    const data_ref01_list = (await data_ref01_ent.list(data_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/data/DataTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = StadtLandFlussSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['data01','data02','data03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'STADT_LAND_FLUSS_TEST_DATA_ENTID': idmap,
    'STADT_LAND_FLUSS_TEST_LIVE': 'FALSE',
    'STADT_LAND_FLUSS_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['STADT_LAND_FLUSS_TEST_DATA_ENTID']

  const live = 'TRUE' === env.STADT_LAND_FLUSS_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['STADT_LAND_FLUSS_TEST_DATA_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new StadtLandFlussSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.STADT_LAND_FLUSS_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
