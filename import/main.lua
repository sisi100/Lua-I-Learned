--[[
    インポートのやり方
    `$ lua import/main.lua`
]]

print("-- 確認1")
require "import.import_source"
print(aa) -- `aa_hoge`, グローバルになる
print(bb) -- `nil`, localは呼べない

print("-- 確認2")
rr = require "import.return_source"
print(rr) -- return_hoge, returnした値を受け取る
print(cc) -- cc_hoge, やっぱりグローバル
print(dd) -- nil,

---------------------------------------------------
---------------------------------------------------
--[[
    インポートは色々あるらしい。
    loadfileがどこかで使えるかもと動かしてみる
]]

print("-- 確認3")
xx = loadfile("import/hoge_func.lua") -- ファイルのpathになったので注意！！
xx() -- `hoge`

-- 事前に変数とか渡したい（↑）

yy = load(xx)
yy() -- `hoge`

-- loadが良さそう

print("-- 確認４")
local Hoge = {}

Hoge.new = function(param)
    local obj = {}
    obj.param = param
    obj.func = function(self)
        print(self.param)
    end
    return obj
end

nn = Hoge.new("hoge_obj")
nn.func(nn) -- `hoge_obj`

-- エラーになった（↓）
-- mm = load(nn.func(nn))
-- mm()

-- チャンクを使うといけるっぽい
oo = load([[nn.func(nn)]])
oo() -- `hoge_obj`
