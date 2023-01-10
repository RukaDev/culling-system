---
sidebar_position: 1
---

# Setup 

This mode uses data generated from [DejaVu Editor](https://github.com/rukadev/dejavu).
Ensure your `DejaVu Editor` map folder output is located in the **workspace** as follows.


![Docusaurus logo](/img/explorer.jpg)

---

## Usage

Within your local script created inside of **StarterPlayerScripts**, require Cyclone from **ReplicatedStorage**, then start culling with the following call.

```lua
local Cyclone = require(game.ReplicatedStorage.Cyclone)

Cyclone.Start()
```


## Next Steps

* [Config](./config.md): Adjust culling-specific settings.

* [Caps](./caps.md): Set individual limits.

* [API](./caps.md): Learn more in-game usage.
