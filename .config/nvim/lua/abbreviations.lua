local cmd = vim.cmd

local abbreviations = {
	inoreabbrev = {
		zzo = 'zombie@zombix.org',
		gte = 'get',

	},
	cnoreabbrev = {
		Wq = "wq!",
		wq = "wq!",
		WQ = "wq!",
		Wqa = "wqa!",
		W = "w!",
		Q = "q!",
		Qa = "qa!",
	}
}

for mode, _ in pairs(abbreviations) do
	for k, v in pairs(abbreviations[mode]) do
		cmd(string.format("%s %s %s", mode, k, v))
	end
end
