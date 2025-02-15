{ lib, pkgs }: {
  plugins = {
    hardtime.enable = true;
    notify.enable = true;
    noice.enable = true;
    neocord.enable = true;
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
  ];

  keymaps = [{
    __unkeyed-1 = "<leader>vk";
    __unkeyed-2 = "<cmd>ShowkeysToggle<cr>";
    desc = "Toggle Show Keys (like screencast)";
  }];
}
