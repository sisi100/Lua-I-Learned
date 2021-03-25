local Hoge = {}

Hoge.new = function(param)
    local obj = {}
    obj.param = param
    obj.func = function(self)
        print(self.param)
    end
    return obj
end

local hoge = Hoge.new("hogehoge")
hoge.func(hoge) -- hogehoge
hoge:func() -- hogehoge, selfが自動で入るっぽい

------------------------------------

local Hoge2 = {}

Hoge2.new = function(param)
    local obj = {}
    obj.param = param
    obj.hoge = Hoge.new(obj.param)

    obj.func = function(self)
        self.hoge:func()
    end
    return obj
end

local hoge2 = Hoge2.new("hoge2")
hoge2:func() -- hoge2
