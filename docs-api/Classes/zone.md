---
sidebar_position: 2
---

# Zone

## Methods

### `removeBoundary`

Removes a boundary instance from the zone.

```js
zone:removeBoundary(i: number) -> none
```

### `mapPosition`

Maps each element to a boundary within the zone.

```js
zone:mapPosition(elements: array, position: object) -> Map
```

### `assignBoundaries`

Assigns each element a boundary in the zone.

```js
zone:assignBoundaries(elements: array, position: object, offset: object) -> none
```

### `draw`

Draws all the boundaries on the canvas.

```js
zone:draw() -> none
```

### `cleanup`

Removes all references of the instance.

```js
zone:cleanup() -> none
```

### `proximity`

Returns true if p1 is within amnt of the instance.

```js
zone:proximity(p1: object, amnt: number) -> boolean
```

### `collision`

Returns true if the sprite collides with a boundary.

```js
zone:collision(sprite: sprite instance, x: number, y: number) -> boolean
```

### `proximitySort`

Sorts the boundaries by proximity.

```js
zone:proximitySort(sprite: sprite instance) -> none
```

## Properties

### `zoneData`
* Type: `array`

The boundary data to create a zone from.
