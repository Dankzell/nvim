local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local autosnippet = ls.extend_decorator.apply(s, {
  snippetType = 'autosnippet',
})

local function in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local snippets = {}

-- Greek autosnippets, active only in math mode.
local greek = {
  -- lowercase
  ['@a'] = '\\alpha',
  ['@b'] = '\\beta',
  ['@g'] = '\\gamma',
  ['@d'] = '\\delta',
  ['@e'] = '\\epsilon',
  ['@z'] = '\\zeta',
  ['@h'] = '\\eta',
  ['@q'] = '\\theta',
  ['@i'] = '\\iota',
  ['@k'] = '\\kappa',
  ['@l'] = '\\lambda',
  ['@m'] = '\\mu',
  ['@n'] = '\\nu',
  ['@x'] = '\\xi',
  ['@p'] = '\\pi',
  ['@r'] = '\\rho',
  ['@s'] = '\\sigma',
  ['@t'] = '\\tau',
  ['@u'] = '\\upsilon',
  ['@f'] = '\\phi',
  ['@c'] = '\\chi',
  ['@y'] = '\\psi',
  ['@w'] = '\\omega',

  -- uppercase
  ['@G'] = '\\Gamma',
  ['@D'] = '\\Delta',
  ['@Q'] = '\\Theta',
  ['@L'] = '\\Lambda',
  ['@X'] = '\\Xi',
  ['@P'] = '\\Pi',
  ['@S'] = '\\Sigma',
  ['@U'] = '\\Upsilon',
  ['@F'] = '\\Phi',
  ['@Y'] = '\\Psi',
  ['@W'] = '\\Omega',
}

for trigger, expansion in pairs(greek) do
  table.insert(
    snippets,
    autosnippet({ trig = trigger, wordTrig = false }, {
      t(expansion),
    }, {
      condition = in_mathzone,
    })
  )
end

-- Inline math
table.insert(
  snippets,
  s(
    'mk',
    fmta('$<>$', {
      i(1),
    })
  )
)

-- Display math
table.insert(
  snippets,
  s(
    'dm',
    fmta(
      [[
\[
  <>
\]
]],
      {
        i(1),
      }
    )
  )
)

-- Equation
table.insert(
  snippets,
  s(
    'eq',
    fmta(
      [[
\begin{equation}
  <>
\end{equation}
]],
      {
        i(1),
      }
    )
  )
)

-- Labeled equation
table.insert(
  snippets,
  s(
    'eql',
    fmta(
      [[
\begin{equation}
  \label{eq:<>}
  <>
\end{equation}
]],
      {
        i(1, 'label'),
        i(2),
      }
    )
  )
)

-- Align
table.insert(
  snippets,
  s(
    'al',
    fmta(
      [[
\begin{align}
  <>
\end{align}
]],
      {
        i(1),
      }
    )
  )
)

-- Figure
table.insert(
  snippets,
  s(
    'fig',
    fmta(
      [[
\begin{figure}[!ht]
  \centering
  \includegraphics[width=\linewidth]{<>}
  \caption{<>}
  \label{fig:<>}
\end{figure}
]],
      {
        i(1, 'figures/path/to/figure.pdf'),
        i(2, 'Caption'),
        i(3, 'label'),
      }
    )
  )
)

-- Two subfigures
table.insert(
  snippets,
  s(
    'subfig',
    fmta(
      [[
\begin{figure}[!ht]
  \centering
  \begin{subfigure}[t]{0.49\linewidth}
    \centering
    \includegraphics[width=\linewidth]{<>}
    \caption{<>}
    \label{fig:<>}
  \end{subfigure}
  \hfill
  \begin{subfigure}[t]{0.49\linewidth}
    \centering
    \includegraphics[width=\linewidth]{<>}
    \caption{<>}
    \label{fig:<>}
  \end{subfigure}
  \caption{<>}
  \label{fig:<>}
\end{figure}
]],
      {
        i(1, 'figures/path/to/figure_a.pdf'),
        i(2, 'Caption A'),
        i(3, 'label-a'),
        i(4, 'figures/path/to/figure_b.pdf'),
        i(5, 'Caption B'),
        i(6, 'label-b'),
        i(7, 'Main caption'),
        i(8, 'main-label'),
      }
    )
  )
)

-- Table
table.insert(
  snippets,
  s(
    'tab',
    fmta(
      [[
\begin{table}[!ht]
  \centering
  \caption{<>}
  \label{tab:<>}
  \begin{tabular}{<>}
    <>
  \end{tabular}
\end{table}
]],
      {
        i(1, 'Caption'),
        i(2, 'label'),
        i(3, 'lcc'),
        i(4, 'Content'),
      }
    )
  )
)

-- Booktabs-style table
table.insert(
  snippets,
  s(
    'btab',
    fmta(
      [[
\begin{table}[!ht]
  \centering
  \caption{<>}
  \label{tab:<>}
  \begin{tabular}{<>}
    \toprule
    <>
    \midrule
    <>
    \bottomrule
  \end{tabular}
\end{table}
]],
      {
        i(1, 'Caption'),
        i(2, 'label'),
        i(3, 'lcc'),
        i(4, 'Header 1 & Header 2 & Header 3 \\\\'),
        i(5, 'Value 1 & Value 2 & Value 3 \\\\'),
      }
    )
  )
)

-- Itemize
table.insert(
  snippets,
  s(
    'item',
    fmta(
      [[
\begin{itemize}
  \item <>
\end{itemize}
]],
      {
        i(1),
      }
    )
  )
)

-- Enumerate
table.insert(
  snippets,
  s(
    'enum',
    fmta(
      [[
\begin{enumerate}
  \item <>
\end{enumerate}
]],
      {
        i(1),
      }
    )
  )
)

-- Description
table.insert(
  snippets,
  s(
    'desc',
    fmta(
      [[
\begin{description}
  \item[<>] <>
\end{description}
]],
      {
        i(1, 'Term'),
        i(2, 'Description'),
      }
    )
  )
)

-- Citation
table.insert(
  snippets,
  s(
    'cite',
    fmta('\\cite{<>}', {
      i(1),
    })
  )
)

-- Textual citation, only useful if your setup/package supports it
table.insert(
  snippets,
  s(
    'citet',
    fmta('\\citet{<>}', {
      i(1),
    })
  )
)

-- Parenthetical citation, only useful if your setup/package supports it
table.insert(
  snippets,
  s(
    'citep',
    fmta('\\citep{<>}', {
      i(1),
    })
  )
)

-- Reference
table.insert(
  snippets,
  s(
    'ref',
    fmta('\\cref{<>}', {
      i(1),
    })
  )
)

-- Equation reference
table.insert(
  snippets,
  s(
    'eqref',
    fmta('\\eqref{eq:<>}', {
      i(1),
    })
  )
)

-- Glossary
table.insert(
  snippets,
  s(
    'gls',
    fmta('\\gls{<>}', {
      i(1),
    })
  )
)

-- Acronym/glossary plural
table.insert(
  snippets,
  s(
    'glspl',
    fmta('\\glspl{<>}', {
      i(1),
    })
  )
)

-- Text formatting
table.insert(
  snippets,
  s(
    'bf',
    fmta('\\textbf{<>}', {
      i(1),
    })
  )
)

table.insert(
  snippets,
  s(
    'it',
    fmta('\\textit{<>}', {
      i(1),
    })
  )
)

table.insert(
  snippets,
  s(
    'tt',
    fmta('\\texttt{<>}', {
      i(1),
    })
  )
)

return snippets
