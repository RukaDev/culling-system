---
sidebar_position: 2
---

# Configuration

## Ranges

Range configs are responsble for adjusting how far a player sees at a point in time.

:::tip
The numberical relationship between range values should be as follows: Broad > Far > Medium > Close
:::

### `OBJECT_RANGES` 

* Type: table of strings

The ranges (far, med, close) at which different layouts will be culled in.

### `BROAD_RANGE`

* Type: number

The range at which a template's ground asset will be culled in.

### `FAR_RANGE`

* Type: number

The range at which 'Far' objects are culled within a template.

### `MEDIUM_RANGE`

* Type: number

The range at which 'Medium' objects are culled within a template.

### `CLOSE_RANGE`

* Type: number

The range at which 'Close' objects are culled within a template.

---

## `REGION_SWITCHING`

* Type: boolean

Whether or not different styled assets are configured.

