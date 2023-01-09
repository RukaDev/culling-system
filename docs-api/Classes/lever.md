---
sidebar_position: 2
---

# Lever

## Static

### `activateAll`

Activates all levers passed, regardless if canActivate() returns true.

```js
Lever.activateAll(levers: array) -> none
```

### `activateCheck`

Checks if each lever can be activated, and if so will activate them.

```js
Lever.activateCheck(levers: array) -> none
```

## Methods

### `isActivated`

Returns true if the instance has been activated.

```js
lever:isActivated() -> boolean
```

### `canActivate`

Returns true if the instance can be activated.

```js
lever:canActivate(position: array) -> boolean
```

### `activate`

Plays an animation and calls the callback property if given.

```js
lever:activate() -> null
```

## Properties

### `sprite`
* Type: `sprite instance`

Sprite to represent the lever

### `callback`
* Type: `function`

Callback called on activation

### `position`
* Type: `array`

Position of the sprite on the canvas


