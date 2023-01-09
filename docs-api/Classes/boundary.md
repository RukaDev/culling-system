---
sidebar_position: 2
---

# Boundary

## Methods

### `collision`

Returns true if the sprite collides with the boundary instance.

```js
boundary:collision(sprite: sprite, x: numher, y: number) -> boolean
```

### `cleanup`

Removes all references of the instance.

```js
boundary:cleanup() -> none
```

### `proximity`

Returns true if p1 is within amnt of the instance.

```js
boundary:proximity(p1: array, amnt: int) -> boolean
```

### `inside`

Returns true if the sprite is completely within the instance

```js
boundary:inside(sprite: sprite) -> boolean
```

### `draw`

Draws the instance on the canvas.

```js
boundary:draw() -> none
```

## Properties

### `zone`
* Type: `zone instance`

The zone a boundary belongs to.
    
### `position`
* Type `array`

Position of the sprite on the canvas


