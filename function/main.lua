
local AA = {}
AA.new = function(bb)
    local func = function()
        print(bb)
        bb = bb -1
    end
    return func
end


aa = AA.new(10)
aa() -- 10
aa() -- 9
aa() -- ...
aa()
aa()
aa()
aa()
aa()
aa()
aa() -- ...
aa() -- 0
aa() -- -1

print(bb) -- nil