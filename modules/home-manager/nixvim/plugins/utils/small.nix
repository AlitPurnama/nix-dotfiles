{ lib, pkgs }: {
  plugins = {
    hardtime.enable = true;
    notify.enable = true;
    noice.enable = true;
    neocord.enable = true;
    todo-comments.enable = true;
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "showkeys";
      src = pkgs.fetchFromGitHub {
        owner = "nvzone";
        repo = "showkeys";
        rev = "main";
        hash = "sha256-0ZONzsCWJzzCYnZpr/O8t9Rmkc4A5+i7X7bkjEk5xmc=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "ultimate-autopair";
      src = pkgs.fetchFromGitHub {
        owner = "altermo";
        repo = "ultimate-autopair.nvim";
        rev = "v0.6";
        hash = "sha256-yPPb7G7/Xx0ybhhRcXCZzGRrehgWqgWRE3nazPPvcjc=";
      };
    })
  ];

  extraConfigLua = # lua
    ''
      require('ultimate-autopair').setup({})
    '';

  keymaps = [{
    __unkeyed-1 = "<leader>vk";
    __unkeyed-2 = "<cmd>ShowkeysToggle<cr>";
    desc = "Toggle Show Keys (like screencast)";
  }];
}
