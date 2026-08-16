loadstring([[local url = "https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"
local raw = game:HttpGet(url)
raw = raw:gsub('script_key%s*=%s*["\'][^"\']*["\']', 'script_key = "2026"')
raw = raw:gsub('local%s+script_key%s*=%s*["\'][^"\']*["\']', 'local script_key = "2026"')
raw = raw:gsub('_G%.script_key%s*=%s*["\'][^"\']*["\']', '_G.script_key = "2026"')
raw = raw:gsub('getgenv%(%)%.script_key%s*=%s*["\'][^"\']*["\']', 'getgenv().script_key = "2026"')
raw = raw:gsub('premium%s*=%s*false', 'premium = true')
raw = raw:gsub('Premium%s*=%s*false', 'Premium = true')
raw = raw:gsub('isPremium%s*=%s*false', 'isPremium = true')
raw = raw:gsub('_G%.premium%s*=%s*false', '_G.premium = true')
raw = raw:gsub('_G%.Premium%s*=%s*false', '_G.Premium = true')
raw = raw:gsub('_G%.isPremium%s*=%s*false', '_G.isPremium = true')
raw = raw:gsub('local%s+premium%s*=%s*false', 'local premium = true')
raw = raw:gsub('local%s+Premium%s*=%s*false', 'local Premium = true')
raw = raw:gsub('local%s+isPremium%s*=%s*false', 'local isPremium = true')
raw = raw:gsub('Hoshi[%w_]*', 'LEXSA PREMIUM')
raw = raw:gsub('HoshiOnTop', 'LEXSA PREMIUM')
raw = raw:gsub('Fluxyyy333', 'LEXSA PREMIUM')
raw = raw:gsub('Hoshi', 'LEXSA PREMIUM')
raw = raw:gsub('Free_key', '2026')
getgenv().script_key = "2026"
getgenv()._G = getgenv()._G or {}
getgenv()._G.script_key = "2026"
getgenv().premium = true
getgenv().Premium = true
getgenv().isPremium = true
getgenv()._G.premium = true
getgenv()._G.Premium = true
getgenv()._G.isPremium = true
loadstring(raw)()]])()