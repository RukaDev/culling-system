---
sidebar_position: 2
---

# Trap

## Static

### `assignCallback`

Assigns callbacks to each trap instance.

```js
Trap.assignCallback(traps: array, callback: function) -> none
```

### `reached`

Checks if each trap has hit the player.

```js
Trap.reached(traps: array, pos: array) -> none
```

## Methods

### `isActive`

Returns true if the instance is active.

```js
trap:isActive() -> boolean
```

### `reset`

Resets the trap.

```js
trap:reset() -> none
```

### `set`

Set the traps to active.

```js
trap:set() -> none
```

### `hitPlayer`

Returns true if the trap hits the player.

```js
trap:hitPlayer() -> boolean
```

### `setMovement`

Sets the trap to be active for intervalLength, and delayed for delayLength.

```js
trap:setMovement(intervalLength: number, delayLength: number) -> none
```

## Properties

### `sprite`
* Type: `sprite instance`

Sprite to represent the trap.

### `timing`
* Type: `object`

The interval and delay times for the instance.

### `position`
* Type: `array`

Position of the instance on the canvas


