# ProjectName SDK exists test

import pytest
from stadtlandfluss_sdk import StadtLandFlussSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = StadtLandFlussSDK.test(None, None)
        assert testsdk is not None
