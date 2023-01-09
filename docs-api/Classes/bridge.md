---
sidebar_position: 3
---

# Bridge

## Static

### `activateAll`

Activates all bridges passed.

```js
Bridge.activateAll(bridges: array) -> none
```

### `deactivateAll`

Deactivates all bridges passed.

```js
Bridge.deactivateAll(bridges: array) -> none
```

## Methods

### `isActive`

Returns true if the instance has been activated.

```js
bridge:isActive() -> boolean
```

### `activate`

Activates the bridge instance.

```js
bridge:activate() -> none
```

### `deactivate`

Deactivates the bridge instance.

```js
bridge:deactivate() -> none
```

## Properties

### `sprite`
* Type: `sprite instance`

Sprite to represent the bridge.

### `callback`
* Type: `function`

Function called on activation.

### `position`
* Type: `object`

Position of the sprite on the canvas.


