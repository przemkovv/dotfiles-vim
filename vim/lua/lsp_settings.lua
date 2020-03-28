
local function lsp_settings_rust()
  local nvim_lsp = require 'nvim_lsp'
  nvim_lsp.rust_analyzer.setup({
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true;
          };
        };
      };
    };
  });
  vim.api.nvim_command [[autocmd Filetype rust setl omnifunc=v:lua.vim.lsp.omnifunc]]
end

local function lsp_settings_viml()
  local nvim_lsp = require 'nvim_lsp'
  nvim_lsp.vimls.setup({});
  vim.api.nvim_command [[autocmd Filetype vim setl omnifunc=v:lua.vim.lsp.omnifunc]]
end

local function lsp_settings_python()
  local nvim_lsp = require 'nvim_lsp'
  nvim_lsp.pyls.setup({
    name = "pyls";
    filetype = {"python"};
    cmd = {"pyls"};
  });
  vim.api.nvim_command [[autocmd Filetype python setl omnifunc=v:lua.vim.lsp.omnifunc]]
end

local function lsp_settings_cpp()
  local nvim_lsp = require 'nvim_lsp'
  nvim_lsp.ccls.setup({
    name = "ccls";
    filetype = {"c", "cpp"};
    cmd = {"ccls", "--log-file=/tmp/ccls.log", '--init={"cache": {"directory": "/home/przemkovv/.cache/ccls"}}'};
    capabilities = {
      offsetEncoding = {"utf-8", "utf-16"};
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true;
          };
        };
      };
    };
    init_options = {
      cache = {
        format = "binary";
        hierarchicalPath = true;
      };
      index = {
        comments = 2;
      };
      completion = {
        caseSensitivity = 1;
        filterAndSort = true;
        detailedLabel = false;
        enableSnippetInsertion = true;
        placeholder = true;
      };
      highlight = {
        lsRanges = true;
      };
      clang = {
        extraArgs = {"-std=c++2a", "--gcc-toolchain=/usr"};
        excludeArgs = {"-fconcepts", "-fno-fat-lto-objects", "-fmax-errors"};
      };
      client = {
        snippetSupport = true;
      };
    };
    on_init = vim.schedule_wrap(function(client, result)
      if result.offsetEncoding then
        client.offset_encoding = result.offsetEncoding
      end
    end)
  });
  vim.api.nvim_command [[autocmd Filetype c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc]]
end

return {
  cpp = lsp_settings_cpp,
  rust = lsp_settings_rust,
  python = lsp_settings_python,
  viml = lsp_settings_viml
}
