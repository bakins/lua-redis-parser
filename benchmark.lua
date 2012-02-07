local parser = require "redis.parser"


local num = 10000000

local q = {'set', 'foo', 3.1415926}

for _,f in ipairs({ "build_query", "build_query_malloc" }) do
    local func = parser[f]
    local start = os.time()
    for i = 0,num do
        func(q)
    end
    print(string.format("%f calls per second", num / (os.time() - start)))
end

