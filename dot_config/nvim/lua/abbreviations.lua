local cmd = vim.cmd

local abbreviations = {
  inoreabbrev = {
    adn = "and",
    awkward = "	•͡˘㇁•͡˘",
    gte = "get",
    lod = "ಠ_ಠ",
    sadface = "ʘ︵ʘ",
    shrug = "¯\\_(ツ)_/¯",
    strong = "ᕙ(⇀‸↼‶)ᕗ",
    taht = "that",
    wehn = "when",
    zzo = "zombie@zombix.org",
    iferr = "if err != nil {}",
    ellipsis = "…",
  },
  cnoreabbrev = {
    Wq = "wq!",
    wq = "wq!",
    WQ = "wq!",
    Wqa = "wqa!",
    W = "w!",
    Q = "q!",
    Qa = "qa!",
  },
}

for mode, _ in pairs(abbreviations) do
  for k, v in pairs(abbreviations[mode]) do
    cmd(string.format("%s %s %s", mode, k, v))
  end
end
