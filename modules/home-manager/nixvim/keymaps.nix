{ }: {
  keymaps = [
    # GROUPS
    {
      __unkeyed-1 = "<leader>w";
      group = "windows";
      icon = "";
    }
    {
      __unkeyed-1 = "<leader>g";
      group = "git";
      icon = "";
    }
    # EO GROUPS
    # highlights search clear
    {
      __unkeyed-1 = "<Esc>";
      __unkeyed-2 = ":nohlsearch<cr>";
      mode = "n";
      desc = "Remove search highlights";
    }
    # Nav
    {
      __unkeyed-1 = "<C-h>";
      __unkeyed-2 = "<C-w><C-h>";
      mode = "n";
      desc = "Move focus to the left window";
    }
    {
      __unkeyed-1 = "<C-l>";
      __unkeyed-2 = "<C-w><C-l>";
      mode = "n";
      desc = "Move focus to the right window";
    }
    {
      __unkeyed-1 = "<C-j>";
      __unkeyed-2 = "<C-w><C-j>";
      mode = "n";
      desc = "Move focus to the lower window";
    }
    {
      __unkeyed-1 = "<C-k>";
      __unkeyed-2 = "<C-w><C-k>";
      mode = "n";
      desc = "Move focus to the upper window";
    }

    #split
    {
      __unkeyed-1 = "<leader>wv";
      __unkeyed-2 = "<cmd>vsplit<cr>";
      mode = "n";
      desc = "[W]indow split [v]ertical";
    }
    {
      __unkeyed-1 = "<leader>wh";
      __unkeyed-2 = "<cmd>split<cr>";
      mode = "n";
      desc = "[W]indow split [h]orizontal";
    }

    # stay visual in indent 
    {
      __unkeyed-1 = "<gv";
      __unkeyed-2 = "<";
      mode = "v";
      desc = "Indent left in visual mode";
    }
    {
      __unkeyed-1 = ">gv";
      __unkeyed-2 = ">";
      mode = "v";
      desc = "Indent right in visual mode";
    }

  ];
}
