require("config.mappings")
require("config.settings")
require("config.lazy")

if jit.os == 'Linux' then
    vim.cmd [[ colorscheme lushwal ]]
elseif jit.os == 'Windows' then
    vim.cmd [[ colorscheme tokyonight ]]
end
