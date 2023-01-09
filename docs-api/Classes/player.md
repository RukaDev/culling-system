---
sidebar_position: 2
---

# Player

## Methods

### `animate`

Sets the spritesheet to the new key value.

```js
player:animate(lastKey: string) -> none
```

### `stop`

Stops the player movement.

```js
player:stop() -> none
```

### `canAttack`

Returns true if the player can attack.

```js
player:canAttack() -> boolean
```

### `calculatePosition`

Calculates the next x, y position of the player.

```js
player:calculatePosition(lastKey: string) -> array
```

### `canMove`

Returns true if the player can move.

```js
player:canMove() -> boolean
```

### `attack`

Plays attack animation and runs hit detection on the passed enemies.

```js
player:attack(enemies: array) -> none
```

### `attackFinished`

Resets player after an attack.

```js
player:attackFinished() -> none
```

## Properties

### `playerSprite`
* Type: `sprite instance`

Sprite to represent the player.

### `attackSprite`
* Type: `sprite instance`

Sprite to represent player attacks.

### `enemyZones`
* Type: `zone instance`

The boundaries used for hit detection on attacks.

### `boundaryZones`
* Type: `zone instance`

The boundaries used for map collisions.


