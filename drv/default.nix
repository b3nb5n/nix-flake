args: {
  dev-env = import ./dev-env.nix args;
  hyprland-workspaces = import ./hyprland-workspaces.nix args;
  lazysql = import ./lazysql.nix args;
  neovim = import ./neovim.nix args;
  vscode-marketplace = import ./vscode-marketplace.nix args;
}
