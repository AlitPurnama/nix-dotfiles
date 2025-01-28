{ inputs, config }: {
  config = {
    extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
      bitwarden
      ublock-origin
      sponsorblock
      darkreader
      auto-tab-discard
      vimium
      privacy-badger
      facebook-container
      decentraleyes
    ];
  };
}
