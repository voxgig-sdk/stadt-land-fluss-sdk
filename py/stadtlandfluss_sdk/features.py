# StadtLandFluss SDK feature factory

from stadtlandfluss_sdk.feature.base_feature import StadtLandFlussBaseFeature
from stadtlandfluss_sdk.feature.ratelimit_feature import StadtLandFlussRatelimitFeature
from stadtlandfluss_sdk.feature.retry_feature import StadtLandFlussRetryFeature
from stadtlandfluss_sdk.feature.test_feature import StadtLandFlussTestFeature
from stadtlandfluss_sdk.feature.timeout_feature import StadtLandFlussTimeoutFeature


_FEATURES = {
    "base": lambda: StadtLandFlussBaseFeature(),
    "ratelimit": lambda: StadtLandFlussRatelimitFeature(),
    "retry": lambda: StadtLandFlussRetryFeature(),
    "test": lambda: StadtLandFlussTestFeature(),
    "timeout": lambda: StadtLandFlussTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
