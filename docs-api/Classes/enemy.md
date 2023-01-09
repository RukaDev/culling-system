---
sidebar_position: 2
---

# Enemy

## Static

### `moveAll`

Move all the enemies if canMove() returns true.

```js
Enemy.moveAll(enemies: array) -> none
```

### `removeAll`

Removes all the enemies in the given array.

```js
Enemy.removeAll(enemies: array) -> none
```

## Methods

### `moveVertical`

```js
enemy:moveVertical() -> none
```

Moves the instance vertically.

### `moveHorizontal`

Moves the instance horizontally.

```js
enemy.moveHorizontal() -> none
```

### `cleanup`

Removes all references of the instance.

```js
enemy:cleanup() -> none
```

### `move`

Moves the enemy according to movex and movey.

```js
enemy:move() -> none
```

### `canMove`

Returns true if the enemy can move.

```js
enemy:canMove() -> boolean
```


## Properties

### `sprite`
* Type: sprite instance

Sprite to represent the enemy.

