---
sidebar_position: 1
---

# Crystal

## Static

### `reached`

Checks if any of the crystals is reached.

```js
Crystal.reached(crystals: array) -> none
```

## Methods

### `cleanup`

Cleans up the crystal instance.

```js
crystal:cleanup() -> null
```

### `isLast`

Returns true if instance is the last crystal left.

```js
crystal:isLast() -> boolean
```

### `nextPosition`

Moves crystal to the next location according to the `positionZone`

```js
crystal:nextPosition() -> none
```

### `reached`

Returns true if the player reaches the crystal with `positionZone` positioning.

```js
crystal:reached() -> none
```

### `singleReached`

Returns true if the player reaches the crystal with `boundary` positioning.

```js
crystal:singleReach() -> none
```

## Properties

### `sprite`
* Type: `sprite instance`

Sprite to represent the crystal.

### `positionZone`
* Type: `zone instance`

The set of positions a crystal takes in order.

### `boundary`
* Type: `boundary instance`

The crystal's position.

