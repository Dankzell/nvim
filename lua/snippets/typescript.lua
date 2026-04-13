local ls = require 'luasnip'
local s, i, t, c = ls.snippet, ls.insert_node, ls.text_node, ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- describe block
  s(
    'describe',
    fmt(
      [[
describe('{}', () => {{
  {}
}})
]],
      {
        i(1, 'subject'),
        i(2, '// test body'),
      }
    )
  ),

  -- it('should …') block
  s(
    'it',
    fmt(
      [[
it('should {}', () => {{
  {}
}})
]],
      {
        i(1, 'do something'),
        i(2, '// arrange/act/assert'),
      }
    )
  ),

  -- expect(...) with matcher choices
  s(
    'expect',
    fmt([[expect({}){}]], {
      i(1, 'value'),
      c(2, {
        fmt('.toBe({})', { i(3, 'expected') }),
        fmt('.toEqual({})', { i(3, 'expected') }),
        fmt('.toStrictEqual({})', { i(3, 'expected') }),
        fmt('.toContain({})', { i(3, 'item') }),
        fmt('.toBeCloseTo({}, {})', { i(3, 'num'), i(4, 'precision') }),
        t '.toBeTruthy()',
        t '.toBeFalsy()',
        fmt('.toThrow({})', { i(3, "'error'") }),
      }),
    })
  ),
}
