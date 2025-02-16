{ pkgs, lib }: {

  plugins = {
    trouble = { enable = true; };
    snacks.settings = {
      picker = {
        actions.__raw = ''require("trouble.sources.snacks").actions'';
        matcher = { frecency = true; };
        win = {
          input = {
            keys.__raw = ''
              {
                ["<c-t>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              }
            '';
          };
        };
        layouts.default.__raw = ''
          {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = true,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.45,
                border = "rounded",
                title_pos = "center",
              },
            },
          }
        '';
      };
    };
  };
  keymaps = [
    {
      __unkeyed-1 = "<leader>xQ";
      __unkeyed-2 = "<cmd>Trouble qflist toggle<cr>";
      mode = "n";
      desc = "Trouble quifick toggle";
    }
    {
      __unkeyed-1 = "<leader>xL";
      __unkeyed-2 = "<cmd>Trouble loclist toggle<cr>";
      mode = "n";
      desc = "Trouble loclist toggle";
    }
    {
      __unkeyed-1 = "<leader>cs";
      __unkeyed-2 = "<cmd>Trouble symbols focus=false<cr>";
      mode = "n";
      desc = "Trouble symbols toggle";
    }
    {
      __unkeyed-1 = "<leader>xx";
      __unkeyed-2 = "<cmd>Trouble diagnostics toggle<cr>";
      mode = "n";
      desc = "Trouble diagnostics toggle";
    }
    {
      __unkeyed-1 = "[c";
      __unkeyed-2 =
        ":lua require('trouble').next {skip_groups = true, jump = true }<cr>";
      desc = "Trouble Next";
      mode = "n";
    }
    {
      __unkeyed-1 = "]c";
      __unkeyed-2 =
        ":lua require('trouble').prev {skip_groups = true, jump = true }<cr>";
      mode = "n";
      desc = "Trouble Prev";
    }
  ];
}
