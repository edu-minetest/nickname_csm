# nickname(CSM)

This mod update your nickname to the server's [nickname mod](https://github.com/edu-minetest/nickname) after join. Only work on Client Side Mod(CSM).

Put it(`nickname` folder) into the `clientmods` directory.

Please note that this mod will not work unless the following pull requests are applied: `feature/add-unregister-function`, `feat/csm-client_ready_etc`, `feat/csm-check_is_single_player`.

The server's minetest configuration must be enable send_chat_message call client-side in csm_restriction_flags:

```ini
csm_restriction_flags = 60
```

And The client's minetest configuration should enable CSM mods loading:

```ini
enable_client_modding = true
```
