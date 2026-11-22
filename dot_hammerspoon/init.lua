local function usbDeviceCallback(data)
  -- debug USB devices
  -- print(hs.inspect.inspect(data))
  -- print(hs.inspect.inspect(hs.usb.attachedDevices()))

  -- detect when YubiKey is connected/disconnected
  if data["productName"] == "YubiKey OTP+FIDO+CCID" then
    if data["eventType"] == "added" then
      print("yubikey connected")
      hs.notify.new({ title = "YubiKey", informativeText = "Connected" }):send()
    elseif data["eventType"] == "removed" then
      print("yubikey disconnected")
      hs.notify.new({ title = "YubiKey", informativeText = "Disconnected" }):send()
    end
  end

  -- detect when USB keyboard is connected/disconnected and switch input source
  if data["productName"] == "USB Keyboard" then
    if data["eventType"] == "added" then
      local layout = "British – PC"
      print(string.format("USB keyboard connected, switching keyboard layout to %s", layout))
      if not hs.keycodes.setLayout(layout) then
        print(string.format("Could not switch keyboard layout to %s", layout))
      end
    elseif data["eventType"] == "removed" then
      local layout = "British"
      print(string.format("USB keyboard disconnected, switching keyboard layout to %s", layout))
      if not hs.keycodes.setLayout(layout) then
        print(string.format("Could not switch keyboard layout to %s", layout))
      end
    end
  end
end

-- Watchers intentionally stay global so Lua does not garbage-collect them.
usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()

-- "USB Product Name" = "YubiKey OTP+FIDO+CCID"
-- "USB Product Name" = "USB Keyboard"
-- "USB Product Name" = "Logitech StreamCam"

-- data
--[[
2021-07-29 10:34:51: {
  eventType = "added",
  productID = 1031,
  productName = "YubiKey OTP+FIDO+CCID",
  vendorID = 4176,
  vendorName = "Yubico"
} ]]

local savedOutput

local function screenCallback(eventType)
  if eventType == hs.caffeinate.watcher.screensDidLock then
    -- A repeated lock notification must not replace the saved volume with zero.
    if savedOutput then
      return
    end

    local device = hs.audiodevice.defaultOutputDevice()
    if not device then
      print("screen locked, no default audio output device")
      return
    end

    local volume = device:outputVolume()
    if volume == nil then
      print("screen locked, audio output device does not support volume control")
      return
    end

    if not device:setOutputVolume(0) then
      print("screen locked, could not silence audio output device")
      return
    end

    savedOutput = { device = device, volume = volume }
    print(string.format("screen locked, volume was set to %.1f", volume))
  elseif eventType == hs.caffeinate.watcher.screensDidUnlock then
    local output = savedOutput
    savedOutput = nil
    if not output then
      return
    end

    -- Restore the device we silenced, even if the default output has changed.
    if output.device:setOutputVolume(output.volume) then
      print(string.format("screen unlocked, restored volume to %.1f", output.volume))
    else
      print("screen unlocked, could not restore audio output volume")
    end
  end
end

screenWatcher = hs.caffeinate.watcher.new(screenCallback)
screenWatcher:start()
