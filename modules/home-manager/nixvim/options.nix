{ config }: {
  config = {
    globals = { mapleader = " "; };
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      ignorecase = true;
      smartcase = true;

      autoindent = true;
      smartindent = true;

      wrap = false;
    };
  };
}
