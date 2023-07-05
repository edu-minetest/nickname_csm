# nickname(CSM)

This mod update your nickname to the server's [nickname mod](https://github.com/edu-minetest/nickname) after join. Only work on Client Side Mod(CSM).

Please note that this mod will not work unless the following pull requests are applied: `feature/add-unregister-function`, `feat/csm-client_ready_etc`, `feat/csm-check_is_single_player`.

## Install

Put it(the `nickname` folder) into the `clientmods` directory.

To allow clients to use `send_chat_message` through CSM, the disable `send_chat_message` flag(`2`) must be removed from the `csm_restriction_flags` setting of the Minetest server's configuration:

```ini
csm_restriction_flags = 60
```

And The client's minetest configuration should enable CSM mods loading:

```ini
enable_client_modding = true
```
