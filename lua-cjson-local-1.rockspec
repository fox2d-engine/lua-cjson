package = "lua-cjson"
version = "local-1"

source = {
    url = ".",
}

description = {
    summary = "A fast JSON encoding/parsing module (local build with enhancements)",
    detailed = [[
        Enhanced version of Lua CJSON with:
        - TurboWarp JSON extensions (Infinity, NaN, -Infinity)
        - JSON object key order tracking via __keyOrder metatable
        - null as nil option for better Lua compatibility
        - 4-9x faster than pure Lua implementation
    ]],
    homepage = "http://www.kyne.au/~mark/software/lua-cjson.php",
    license = "MIT"
}

dependencies = {
    "lua >= 5.1"
}

build = {
    type = "builtin",
    modules = {
        cjson = {
            sources = { "lua_cjson.c", "strbuf.c", "fpconv.c" },
            defines = {
                -- Optional platform-specific defines
            }
        }
    },
    install = {
        lua = {
            ["cjson.util"] = "lua/cjson/util.lua"
        },
        bin = {
            json2lua = "lua/json2lua.lua",
            lua2json = "lua/lua2json.lua"
        }
    },
    copy_directories = { "tests" }
}

-- vi:ai et sw=4 ts=4:
