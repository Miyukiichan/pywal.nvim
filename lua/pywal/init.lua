local M = {}

function M.setup(opts)
	local core = require('pywal.core')
	-- Need to set globally so that core can get the path from the lualine theme context
	vim.g.pywalPath = opts.pywalPath or "$HOME/.cache/wal/colors-wal.vim"
	local colors = core.get_colors()
	vim.opt.termguicolors = true
	M.highlight_all(colors)
end

function M.highlight_all(colors)
	local config = require('pywal.config')
	local base_highlights = config.highlights_base(colors)
	for group, properties in pairs(base_highlights) do
		vim.api.nvim_set_hl(0, group, properties)
	end
end

return M
