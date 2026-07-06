# frozen_string_literal: true

# Typed models for the StadtLandFluss SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Data entity data model.
#
# @!attribute [rw] beruf
#   @return [Array, nil]
#
# @!attribute [rw] fluss
#   @return [Array, nil]
#
# @!attribute [rw] land
#   @return [Array, nil]
#
# @!attribute [rw] marke
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [Array, nil]
#
# @!attribute [rw] pflanze
#   @return [Array, nil]
#
# @!attribute [rw] stadt
#   @return [Array, nil]
#
# @!attribute [rw] tier
#   @return [Array, nil]
Data = Struct.new(
  :beruf,
  :fluss,
  :land,
  :marke,
  :name,
  :pflanze,
  :stadt,
  :tier,
  keyword_init: true
)

# Request payload for Data#list.
#
# @!attribute [rw] beruf
#   @return [Array, nil]
#
# @!attribute [rw] fluss
#   @return [Array, nil]
#
# @!attribute [rw] land
#   @return [Array, nil]
#
# @!attribute [rw] marke
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [Array, nil]
#
# @!attribute [rw] pflanze
#   @return [Array, nil]
#
# @!attribute [rw] stadt
#   @return [Array, nil]
#
# @!attribute [rw] tier
#   @return [Array, nil]
DataListMatch = Struct.new(
  :beruf,
  :fluss,
  :land,
  :marke,
  :name,
  :pflanze,
  :stadt,
  :tier,
  keyword_init: true
)

