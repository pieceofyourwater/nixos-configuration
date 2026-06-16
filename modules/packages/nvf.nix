{ inputs, self, ... }: {

  flake.lib.nvfConfig = {
    vim = { lib, ... }: {
      theme = {
        enable = true;
        name = "onedark";
        style = "dark";
        transparent = true;
      };

      options = {
        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        undofile = true;
      };

      globals.mapleader = " ";

      lsp = {
        enable = true;
        nvim-docs-view.enable = true;
        lspkind.enable = true;
      };

      luaConfigPost = ''
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "nix",
            callback = function()
                vim.opt_local.tabstop = 2
                vim.opt_local.shiftwidth = 2
            end,
        })
      '';

      keymaps = [
        {
          key = "<leader>e";
          mode = "n";
          action = "<cmd>Ex<CR>";
          desc = "Open File Explorer";
          silent = true;
        }
      ];

      languages = {
        enableTreesitter = true;

        nix = {
          enable = true;
          lsp.servers = [ "nixd" ];
        };
        clang.enable = true;
        python.enable = true;
        typescript.enable = true;
        haskell.enable = true;
        rust.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "onedark";
      };

      terminal.toggleterm = {
        enable = true;
        setupOpts.winbar.name_formatter = lib.generators.mkLuaInline ''function(term)  return (term.name):match(".*/(.*)"):match("(.-);") end '';
        lazygit = {
          enable = true;
        };
      };

      utility = {
        images.img-clip.enable = true;
        undotree.enable = true;
      };

      telescope.enable = true;
      autocomplete.blink-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
    };
  };
  perSystem = { pkgs, ... }: {
    packages.neovim = (
      inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ self.lib.vim ];
      }
    );
  };

}
