return function(_)
  local colors = require("colorbuddy.init").colors
  local Group = require("colorbuddy.init").Group
  local groups = require("colorbuddy.init").groups

  Group.new("NeogitDiffAdd", groups.DiffAdd)
  Group.new("NeogitDiffAddHighlight", groups.NeogitDiffAdd, colors.green:dark():dark())
  Group.new("NeogitDiffDelete", groups.DiffDelete)
  Group.new("NeogitDiffDeleteHighlight", groups.NeogitDiffDelete, colors.red:dark():dark():dark())
  Group.new("NeogitDiffContextHighlight", colors.baseForeground, colors.black1)

  Group.new("NeogitHunkHeader", groups.Normal)
  Group.new("NeogitHunkHeaderHighlight", groups.Normal)

  Group.new("NeogitCommandText", groups.Normal)
  Group.new("NeogitCommandTimeText", groups.Normal)
  Group.new("NeogitCommandCodeNormal", groups.Normal)
  Group.new("NeogitCommandCodeError", groups.Error)
end
