---
sidebar_position: 4
---

# Game

## Core Functions

Each game contains three core functions

### Setup

Used to setup all the assets, images, and other info used in the game. Images is passed as a paramter and represents the pre-loaded images set in the pre-game file.

```js title="src/js/scripts/home.js"
setupGame(images) {
    // Config
    fade.in(4)
    canvas.setup(1080, 1920)
    input.setup('w')
    fps.setup(75)

    // Sprites
    var backgroundSprite = new Sprite({
        position: {
            x: offset.x,
            y: offset.y
        },
        image: images.background,
        moveable: true
    })

    var playerSprite = new Sprite({
        position: {
            x: (canvas.instance.width / 2 - images.player.width / 8),
            y: (canvas.instance.height / 2 - imsages.player.height / 2)
        },
        image: images.player,
        frames: {xmax: 3, ymax: 4},
        scale: 3.5
    })

    var foregroundSprite = new Sprite({
        position: {
            x: offset.x,
            y: offset.y
        },
        moveable: true,
        image: images.foreground
    })

    var crystalSprite = new Sprite({
        image: images.crystal,
        frames: {xmax: 3, ymax: 1},
        velocity: 40,
        scale: 2,
        moveable: true
    })

    // Level
    level.create(backgroundSprite, foregroundSprite, offset)

    // Zones
    var boundaryZone = new Zone(boundaryData)
    var crystalZone = new Zone(crystalData)

    // Player
    var player = new Player({
        playerSprite: playerSprite,
        boundaryZones: [boundaryZone],
    })

    // Crystal
    var crystal = new Crystal({
        sprite: crystalSprite,
        positionZone: crystalZone,
    })

    startGame(player, crystal)
}
```

### Start

This is where the core game logic is. It controls how the game functions, and all the assets created in the setup are passed as the parameter.

```js title="src/js/scripts/home.js"
startGame(player, crystal) {

    // Core loop
    function step() {
        const animId = window.requestAnimationFrame(step)

        if (fps.advance()) {
            // Crystal
            if (crystal.reached(player.playerSprite)) {
                if (crystal.isLast()) {
                    endGame(animId)
                } else {
                    crystal.nextPosition()
                }
            }

            // Movement
            if (input.isPressed(['w', 'a', 's', 'd'])) {
                var {x, y} = player.calculatePosition(input.lastKey)
                if (player.canMove(x, y)) {
                    player.animate(input.lastKey)
                    canvas.moveElements(x, y)
                }
            } else {
                player.stop()
            }

            // Draw
            canvas.drawElements()
        }
    }

    step()
}
```

### End

This function is called within the startGame() function whenever the user determines the game is complete. It will return back to the world map while playing a fade out effect on the canvas and setting any additional data.

```js title="src/js/scripts/home.js"
endGame(animId) {
    window.cancelAnimationFrame(animId)
    fade.out(1.5, function() {
        history.back()
    })
}
```
