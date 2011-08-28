-- (c) 2009-2011 John MacFarlane. Released under MIT license.
-- See the file LICENSE in the source for details.

local Tex = require("lunamark.writer.tex")
local util = require("lunamark.util")

local gsub = string.gsub

local Latex = util.table_copy(Tex)

local format = string.format

Latex.options = { }

function Latex.code(s)
  return format("\\texttt{%s}", Latex.string(s))
end

function Latex.link(lab,src,tit)
  return format("\\href{%s}{%s}", Latex.string(src), lab)
end

function Latex.image(lab,src,tit)
  return format("\\includegraphics{%s}", Latex.string(src))
end

function Latex.listitem(s)
  return format("\\item %s\n",s)
end

function Latex.bulletlist(s)
  return format("\\begin{itemize}\n%s\n\\end{itemize}",s)
end

function Latex.orderedlist(s)
  return format("\\begin{enumerate}\n%s\n\\end{enumerate}",s)
end

function Latex.emphasis(s)
  return format("\\emph{%s}",s)
end

function Latex.strong(s)
  return format("\\textbf{%s}",s)
end

function Latex.blockquote(s)
  return format("\\begin{quote}\n%s\n\\end{quote}", s)
end

function Latex.verbatim(s)
  return format("\\begin{verbatim}\n%s\\end{verbatim}", s)
end

function Latex.section(s,level,contents)
  local cmd
  if level == 1 then
    cmd = "\\section"
  elseif level == 2 then
    cmd = "\\subsection"
  elseif level == 3 then
    cmd = "\\subsubsection"
  elseif level == 4 then
    cmd = "\\paragraph"
  elseif level == 5 then
    cmd = "\\subparagraph"
  else
    cmd = ""
  end
  return format("%s{%s}%s%s", cmd, s, Latex.interblocksep, contents)
end

Latex.hrule = "\\hspace{\\fill}\\rule{.6\\linewidth}{0.4pt}\\hspace{\\fill}"

return Latex
