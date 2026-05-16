
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { StadtLandFlussSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await StadtLandFlussSDK.test()
    equal(null !== testsdk, true)
  })

})
