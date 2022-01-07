function usbDeviceCallback(data)
	-- debug USB devices
	-- print(hs.inspect.inspect(data))
	-- print(hs.inspect.inspect(hs.usb.attachedDevices()))

	-- detect when YubiKey is connected/disconnected
	if data["productName"] == "YubiKey OTP+FIDO+CCID" then
		if data["eventType"] == "added" then
			print("yubikey connected")
		elseif data["eventType"] == "removed" then
			print("yubikey disconnected")
		end
	end

	-- detect when USB keyboard is connected/disconnected and switch input source
	if data["productName"] == "USB Keyboard" then
		if data["eventType"] == "added" then
			layout = "British – PC"
			print(string.format("USB keyboard connected, switching keyboard layout to %s", layout))
			result = hs.keycodes.setLayout(layout)
			if not result then
				print(string.format("Could not switch keyboard layout to %s", layout))
			end
		elseif data["eventType"] == "removed" then
			layout = "British"
			print(string.format("USB keyboard disconnected, switching keyboard layout to %s", layout))
			result = hs.keycodes.setLayout(layout)
			if not result then
				print(string.format("Could not switch keyboard layout to %s", layout))
			end
		end
	end
end

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

function screenCallback(eventType)
	if (eventType == 10) then
		volume = hs.audiodevice.defaultOutputDevice():volume()
		print(string.format("screen locked, volume was set to %i", volume))
		hs.audiodevice.defaultOutputDevice():setVolume(0)
	elseif (eventType == 11) then
		print(string.format("screen unlocked, setting volume to %i", volume))
		hs.audiodevice.defaultOutputDevice():setVolume(volume)
	end
end

screenWatcher = hs.caffeinate.watcher.new(screenCallback)
screenWatcher:start()
