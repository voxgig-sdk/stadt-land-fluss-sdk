# StadtLandFluss SDK feature factory

from feature.base_feature import StadtLandFlussBaseFeature
from feature.test_feature import StadtLandFlussTestFeature


def _make_feature(name):
    features = {
        "base": lambda: StadtLandFlussBaseFeature(),
        "test": lambda: StadtLandFlussTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
