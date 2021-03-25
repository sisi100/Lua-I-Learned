--[[
    スコープ
    `$ lua scope/main.lua`

    関数を貫通する。
    何もつけないとグローバルになるとのこと
]]

-- 確認１
function hoge()
    aa = "hoge!"
    print(aa)
end
hoge() -- `hoge!`
print(aa) -- `hoge!`

-- 確認２
function fugafuga()
    bb = "fuba!"
    print(bb)
end
print(bb) -- `nil`, 呼ばれないと値は入らない

-- 確認3
function hogefuga()
    print(aa)
end
hogefuga() -- `hoge!`, 当然呼べる

--[[
    関数内に閉じ込める
]]
function localhoge()
    local cc = "cc_hoge"
    print(cc)
end
localhoge() -- `cc_hoge`
print(cc) -- nil, 呼べない
