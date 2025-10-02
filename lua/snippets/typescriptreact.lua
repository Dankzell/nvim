local ls = require 'luasnip'
local s, i, t, f = ls.snippet, ls.insert_node, ls.text_node, ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- React FC scaffold
  s(
    'rfc',
    fmt(
      [[
    interface {}Props {{
      {}
    }}

    export function {}({}: {}Props) {{
      return (
        <>
          {}
        </>
      )
    }}
  ]],
      {
        i(1, 'Component'), -- used twice (name + Props)
        i(2), -- interface body
        i(1), -- repeats component name
        i(3, 'props'), -- function arg name
        i(4), -- inside JSX
        i(5),
      }
    )
  ),

  -- useState: [value, setValue] with auto-capitalized setter
  s(
    'usf',
    fmt(
      [[
    const [{}, set{}] = useState({})
  ]],
      {
        i(1),
        f(function(args)
          local str = args[1][1] or ''
          return (str:gsub('^%l', string.upper))
        end, { 1 }), -- take text from insert node 1
        i(2),
      }
    )
  ),

  -- useEffect
  s(
    'uef',
    fmt(
      [[
    useEffect(() => {{
      {}
    }}, [{}])
  ]],
      {
        i(1), -- effect body
        i(2), -- deps list
      }
    )
  ),

  -- useCallback
  s(
    'ucb',
    fmt(
      [[
    const {} = useCallback(({}: {}) => {{
      {}
    }}, [{}])
  ]],
      {
        i(1, 'fn'), -- const name
        i(2, 'args'), -- params
        i(3, 'unknown'), -- param type
        i(4), -- body
        i(5), -- deps
      }
    )
  ),
}
