local minetest, DIR_DELIM, Settings = core, DIR_DELIM, Settings
local log = minetest.log

local server_info = minetest.get_server_info()
-- print('server_info', dump(server_info))

local function getIndex(l, value)
  for k, v in pairs(l) do
    if v == value then return k end
  end
end

--[[
local function rmValue(l, value)
  local id = getIndex(l, value)
  if id then l[id] = nil end
end
--]]

if server_info.is_singleplayer == false then
  local mod_data_path = minetest.get_mod_data_path('nickname') .. DIR_DELIM
  -- print('TCL:: ~ file: init.lua:8 ~ mod_data_path:', mod_data_path);
  -- local registered = minetest.registered_on_receiving_chat_message

  minetest.register_on_client_ready(function()
    minetest.after(0.1, function()
    local player = minetest.localplayer
    local playerName = player and player:get_name()
    if playerName then
      local isNicknameInstalled = true
      minetest.run_server_chatcommand('nickname', '')

      local unHook
      unHook = minetest.register_on_receiving_chat_message(function(message)
        local pos = string.find(message:lower(), 'invalid%s+command')
        if pos ~= nil then
          log('warning', 'No nickname mod installed on server')
          isNicknameInstalled = false
        end
        print('nickname installed:', isNicknameInstalled)
        -- rmValue(registered, testReceived)
        unHook()
        return true -- will not be shown to chat
      end)

      minetest.after(0.6, function()
        if not isNicknameInstalled then return end
        local conf = Settings(mod_data_path .. playerName .. '.conf'):to_table()
        for k, v in pairs(conf) do
          if k == 'text' or k == 'color' or k == 'bgcolor' then
            if k == 'text' then
              k = 'nickname'
            else
              k = 'nickname_' .. k
            end
            local unHook
            -- maybe (missing privileges: nickname)
            unHook = minetest.register_on_receiving_chat_message(function(message)
              print(message)
              -- rmValue(registered, receivedResult)
              unHook()
              return true
            end)
            minetest.run_server_chatcommand(k, v)
          end
        end
      end)
    end
  end)
  end)
end


-- minetest.register_on_client_ready(function()
-- 	print("register_on_client_ready2")
-- end)

-- minetest.register_on_camera_ready(function()
-- 	print("register_on_camera_ready", dump(minetest.camera))
-- end)

-- minetest.register_on_minimap_ready(function()
-- 	print("register_on_minimap_ready", dump(minetest.ui.minimap))
-- end)
