{ pkgs, repos, usrLib, config, ... }: {
  # programs.eww = {
  #   enable = true;
  #   configDir = ./config;
  # };

  home.packages = with pkgs; [ eww ];
  imports = [ ./assets.nix ];

  xdg.configFile."eww/widgets.yuck".source = ./widgets.yuck;
  xdg.configFile."eww/eww.yuck".text = ''
    (include "./widgets.yuck")
    (deflisten workspaces "${repos.usrDrv.hyprland-workspaces}/bin/hyprland-workspaces _")
    (defwindow status-bar
      :monitor 0
      :stacking "fg"
      :exclusive true
      :focusable false
      :geometry (geometry
        :x "0%"
        :y "8px"
        :width "100%"
        :height "36px"
        :anchor "top center"
      )
      (status-bar :workspaces workspaces)
    )
  '';

  # ${lib.concatStrings
  # (lib.lists.imap0 (i: m: "\n") config.hardwareInfo.monitors)}

  xdg.configFile."eww/eww.scss".text =
    with config.theme.color // usrLib.color; ''
      .widget-group {
        padding: 4px 12px;
        border-radius: 4px;
        background: ${hex (builtins.elemAt bg 1)};
        color: ${hex (builtins.elemAt fg 0)};
      }

      .home-icon {
        padding: 0px 8px;
      }

      .workspace-button {
        all: unset;
        padding: 0px 12px;
        background: ${hex (builtins.elemAt bg 1)};
        color: ${hex (builtins.elemAt fg 0)};

        &:hover {
          background: ${hex (builtins.elemAt bg 2)}
        }

        &.active {
          background: ${hex accent.default};
          color: ${hex (builtins.elemAt bg 0)};
        }
      }

      .workspace-group button:first-child {
        border-top-left-radius: 4px;
        border-bottom-left-radius: 4px;
      }

      .workspace-group button:last-child {
        border-top-right-radius: 4px;
        border-bottom-right-radius: 4px;
      }

      window {
        background: transparent;
      }

      .status-bar {
        margin: 0px 8px;
        padding: 6px;
        background: ${hex (builtins.elemAt bg 0)};
        border-radius: 8px;
      }
    '';
}
