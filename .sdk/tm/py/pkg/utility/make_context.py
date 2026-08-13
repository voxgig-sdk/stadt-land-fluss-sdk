# StadtLandFluss SDK utility: make_context

from projectname_sdk.core.context import StadtLandFlussContext


def make_context_util(ctxmap, basectx):
    return StadtLandFlussContext(ctxmap, basectx)
