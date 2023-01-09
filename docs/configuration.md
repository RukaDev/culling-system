---
sidebar_position: 3
---

# Configuration

All games made run within a single html file that contains configuration for each game, as well as the backbone files that run behind the scenes.

## Global

The global section includes all classes, utils, and modules that are used within every game. They make up the core components of each game. 

```js
<!-- Classes -->
<script src = '/js/classes/player.js'></script>
<script src = '/js/classes/boundary.js'></script>
<script src = '/js/classes/sprite.js'></script>
<script src = '/js/classes/sprite.js'></script>

<!-- Utils -->
<script src = '/js/util/math.js'></script>
<script src = '/js/util/table.js'></script>
<script src = '/js/util/storage.js'></script>

<!-- Modules -->
<script src = '/js/modules/fps.js'></script>
<script src = '/js/modules/image.js'></script>
<script src = '/js/modules/fade.js'></script>
<script src = '/js/modules/input.js'></script>
<script src = '/js/modules/canvas.js'></script>
```

### Classes
Classes are referenced by 'js/classes/', and comprise of gameplay-specific methods.

### Utility
Utility files are referenced by 'js/utility/', and compose of independent, commonly used methods.

### Modules
Module files are referenced by 'js/modules/', and consist of frequently used game-specific methods.

---

## Game

The game config contains different configuration types for each level. Below lists the different configuration categories and how they are created.

```js
home: {
    js: [
        '/js/data/zones/home/boundary.js',
    ],

    keys: {
        w: 'up',
        a: 'left',
        s: 'down',
        d: 'right'
    }

    images: {
        background: '/media/images/maps/home/map.png',
        player: '/media/images/sprites/characters/chara/png'
    }

    title: 'Green Village',
    description: "Use 'WASD' to traverse the map and collect crystals."
}
```

### Title

The title of the game that will be featured at the top of the level.

### Description
The description of the game that will be featured under the title header.

### JS
These are the javascript files specific to this game. They may be shared between other games, but aren't common enough to be global.

### Keys
Key bindings used for this level as well as a description of what that key does. When compiled this will be featured on the screen.

### Images
Images are pre-loaded before a game starts running to ensure no errors may occur. 


