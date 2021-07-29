usbWatcher = nil

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
			print("USB keyboard connected, switching input source")
			hs.keycodes.setLayout("British - PC")
		elseif data["eventType"] == "removed" then
			print("USB keyboard disconnected, switching input source")
			hs.keycodes.setLayout("British")
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
