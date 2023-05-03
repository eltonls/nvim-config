local colors = require("tokyonight.colors").setup()
---- source provider functions
-- Code diagnostics
local diagnostic = require("galaxyline.providers.diagnostic")
-- Version control
local vcs = require("galaxyline.providers.vcs")
-- Core files information
local fileinfo = require("galaxyline.providers.fileinfo")
-- Extensions, aka plugins
local extension = require("galaxyline.providers.extensions")
-- Neovim highlighting
local colors = require("galaxyline.highlighting")
-- Buffer information, e.g. corresponding icon
local buffer = require("galaxyline.providers.buffer")
-- Search results
local search = require("galaxyline.providers.search")
-- Spacing
local whitespace = require("galaxyline.providers.whitespace")
-- Active language server information
local lspclient = require("galaxyline.providers.lsp")
-- Theming


---- Providers
BufferIcon  = buffer.get_buffer_type_icon
BufferNumber = buffer.get_buffer_number
FileTypeName = buffer.get_buffer_filetype
-- Git Provider
GitBranch = vcs.get_git_branch
DiffAdd = vcs.diff_add             -- support vim-gitgutter vim-signify gitsigns
DiffModified = vcs.diff_modified   -- support vim-gitgutter vim-signify gitsigns
DiffRemove = vcs.diff_remove       -- support vim-gitgutter vim-signify gitsigns
-- Search Provider
SearchResults = search.get_results
-- File Provider
LineColumn = fileinfo.line_column
FileFormat = fileinfo.get_file_format
FileEncode = fileinfo.get_file_encode
FileSize = fileinfo.get_file_size
FileIcon = fileinfo.get_file_icon
FileName = fileinfo.get_current_file_name
LinePercent = fileinfo.current_line_percent
ScrollBar = extension.scrollbar_instance
VistaPlugin = extension.vista_nearest
-- Whitespace
Whitespace = whitespace.get_item
-- Diagnostic Provider
DiagnosticError = diagnostic.get_diagnostic_error
DiagnosticWarn = diagnostic.get_diagnostic_warn
DiagnosticHint = diagnostic.get_diagnostic_hint
DiagnosticInfo = diagnostic.get_diagnostic_info
-- LSP
GetLspClient = lspclient.get_lsp_client
