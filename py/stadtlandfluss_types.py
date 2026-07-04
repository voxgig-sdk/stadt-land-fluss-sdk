# Typed models for the StadtLandFluss SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Data:
    beruf: Optional[list] = None
    fluss: Optional[list] = None
    land: Optional[list] = None
    marke: Optional[list] = None
    name: Optional[list] = None
    pflanze: Optional[list] = None
    stadt: Optional[list] = None
    tier: Optional[list] = None


@dataclass
class DataListMatch:
    beruf: Optional[list] = None
    fluss: Optional[list] = None
    land: Optional[list] = None
    marke: Optional[list] = None
    name: Optional[list] = None
    pflanze: Optional[list] = None
    stadt: Optional[list] = None
    tier: Optional[list] = None

