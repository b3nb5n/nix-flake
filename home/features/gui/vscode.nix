{ pkgs, const, config, utils, ... }: let
  extensions = (import (pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "nix-vscode-extensions";
    rev = "master";
    sha256 = "EHcoK/LUo3wI/IFTRWkXWKow58zy6x25MXvz48izSLs=";
  })).extensions.${const.system.system}.vscode-marketplace;
in {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with extensions; [
      jnoortheen.nix-ide
      naumovs.color-highlight
      miguelsolorio.fluent-icons
      pkief.material-icon-theme
      eamodio.gitlens
      rust-lang.rust-analyzer
      mtxr.sqltools
      vadimcn.vscode-lldb
      wallabyjs.console-ninja
      tamasfe.even-better-toml
      github.copilot
      golang.go
      ms-vscode.hexeditor
      vincaslt.highlight-matching-tag
      yoavbls.pretty-ts-errors
      simonsiefke.svg-preview
      albert.tabout
      tauri-apps.tauri-vscode
      meganrogge.template-string-converter
      uctakeoff.vscode-counter
      antiantisepticeye.vscode-color-picker
      redhat.vscode-yaml
    ];
    keybindings = [];
    languageSnippets = {};
    userSettings = with const.theme.colors // utils.theme; {
      "window.menuBarVisibility" = "toggle";
      "workbench.productIconTheme" = "fluent-icons";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.fontFamily" = const.theme.fonts.mono;
      "editor.quickSuggestions" = {
        other = true;
        comments = false;
        strings = false;
      };
      "editor.suggestSelection" = "first";
      "editor.suggestInsertMode" = "replace";
      "editor.tabSize" = 2;
      "editor.cursorSurroundingLines" = 8;
      "editor.linkedEditing" = true;
      "editor.minimap.enabled" = false;
      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;
      "terminal.integrated.fontFamily" = const.theme.fonts.mono;
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.enableMultiLinePasteWarning" = false;
      "terminal.integrated.env.linux" = {};
      "telemetry.telemetryLevel" = "off";
      "workbench.colorCustomizations" = {
        foreground = "#${hex base05}";
        disabledForeground = "#${hex base04}";
        "widget.shadow" = "#${hex base00}";
        "selection.background" = "#${hex base0D}";
        descriptionForeground = "#${hex base03}";
        errorForeground = "#${hex base08}";
        "icon.foreground" = "#${hex base04}";
        "textBlockQuote.background" = "#${hex base01}";
        "textBlockQuote.border" = "#${hex base0D}";
        "textCodeBlock.background" = "#${hex base00}";
        "textLink.activeForeground" = "#${hex base0C}";
        "textLink.foreground" = "#${hex base0D}";
        "textPreformat.foreground" = "#${hex base0D}";
        "textSeparator.foreground" = "#${hex base05}";
        "toolbar.hoverBackground" = "#${hex base02}";
        "toolbar.activeBackground" = "#${hex base03}";
        "button.background" = "#${hex base0D}";
        "button.foreground" = "#${hex base07}";
        "button.hoverBackground" = "#${hex base04}";
        "button.secondaryForeground" = "#${hex base07}";
        "button.secondaryBackground" = "#${hex base0E}";
        "button.secondaryHoverBackground" = "#${hex base04}";
        "checkbox.background" = "#${hex base00}";
        "checkbox.foreground" = "#${hex base05}";
        "dropdown.background" = "#${hex base00}";
        "dropdown.listBackground" = "#${hex base00}";
        "dropdown.foreground" = "#${hex base05}";
        "input.background" = "#${hex base00}";
        "input.foreground" = "#${hex base05}";
        "input.placeholderForeground" = "#${hex base03}";
        "inputOption.activeBackground" = "#${hex base02}";
        "inputOption.activeBorder" = "#${hex base09}";
        "inputOption.activeForeground" = "#${hex base05}";
        "inputValidation.errorBackground" = "#${hex base08}";
        "inputValidation.errorForeground" = "#${hex base05}";
        "inputValidation.errorBorder" = "#${hex base08}";
        "inputValidation.infoBackground" = "#${hex base0D}";
        "inputValidation.infoForeground" = "#${hex base05}";
        "inputValidation.infoBorder" = "#${hex base0D}";
        "inputValidation.warningBackground" = "#${hex base0A}";
        "inputValidation.warningForeground" = "#${hex base05}";
        "inputValidation.warningBorder" = "#${hex base0A}";
        "scrollbar.shadow" = "#${hex base01}";
        "scrollbarSlider.activeBackground" = "#${hex base04}";
        "scrollbarSlider.background" = "#${hex base02}";
        "scrollbarSlider.hoverBackground" = "#${hex base03}";
        "badge.background" = "#${hex base00}";
        "badge.foreground" = "#${hex base05}";
        "progressBar.background" = "#${hex base03}";
        "list.activeSelectionBackground" = "#${hex base02}";
        "list.activeSelectionForeground" = "#${hex base05}";
        "list.dropBackground" = "#${hex base07}";
        "list.focusBackground" = "#${hex base02}";
        "list.focusForeground" = "#${hex base05}";
        "list.highlightForeground" = "#${hex base07}";
        "list.hoverBackground" = "#${hex base02}";
        "list.hoverForeground" = "#${hex base05}";
        "list.inactiveSelectionBackground" = "#${hex base02}";
        "list.inactiveSelectionForeground" = "#${hex base05}";
        "list.inactiveFocusBackground" = "#${hex base02}";
        "list.invalidItemForeground" = "#${hex base08}";
        "list.errorForeground" = "#${hex base08}";
        "list.warningForeground" = "#${hex base0A}";
        "listFilterWidget.background" = "#${hex base00}";
        "listFilterWidget.noMatchesOutline" = "#${hex base08}";
        "list.filterMatchBackground" = "#${hex base02}";
        "tree.indentGuidesStroke" = "#${hex base05}";
        "activityBar.background" = "#${hex base01}";
        "activityBar.dropBackground" = "#${hex base07}";
        "activityBar.foreground" = "#${hex base05}";
        "activityBar.inactiveForeground" = "#${hex base03}";
        "activityBarBadge.background" = "#${hex base0D}";
        "activityBarBadge.foreground" = "#${hex base07}";
        "activityBar.activeBackground" = "#${hex base02}";
        "sideBar.background" = "#${hex base01}";
        "sideBar.foreground" = "#${hex base05}";
        "sideBar.dropBackground" = "#${hex base02}";
        "sideBarTitle.foreground" = "#${hex base05}";
        "sideBarSectionHeader.background" = "#${hex base01}";
        "sideBarSectionHeader.foreground" = "#${hex base05}";
        "minimap.findMatchHighlight" = "#${hex base0A}";
        "minimap.selectionHighlight" = "#${hex base02}";
        "minimap.errorHighlight" = "#${hex base08}";
        "minimap.warningHighlight" = "#${hex base0A}";
        "minimap.background" = "#${hex base00}";
        "minimap.selectionOccurrenceHighlight" = "#${hex base03}";
        "minimapGutter.addedBackground" = "#${hex base0B}";
        "minimapGutter.modifiedBackground" = "#${hex base0E}";
        "minimapGutter.deletedBackground" = "#${hex base08}";
        "editorGroup.background" = "#${hex base00}";
        "editorGroup.dropBackground" = "#${hex base02}";
        "editorGroupHeader.noTabsBackground" = "#${hex base01}";
        "editorGroupHeader.tabsBackground" = "#${hex base01}";
        "editorGroup.emptyBackground" = "#${hex base00}";
        "editorGroup.dropIntoPromptForeground" = "#${hex base06}";
        "editorGroup.dropIntoPromptBackground" = "#${hex base00}";
        "tab.activeBackground" = "#${hex base02}";
        "tab.unfocusedActiveBackground" = "#${hex base02}";
        "tab.activeForeground" = "#${hex base05}";
        "tab.inactiveBackground" = "#${hex base01}";
        "tab.inactiveForeground" = "#${hex base05}";
        "tab.unfocusedActiveForeground" = "#${hex base04}";
        "tab.unfocusedInactiveForeground" = "#${hex base04}";
        "tab.hoverBackground" = "#${hex base02}";
        "tab.unfocusedHoverBackground" = "#${hex base02}";
        "tab.activeModifiedBorder" = "#${hex base0D}";
        "tab.inactiveModifiedBorder" = "#${hex base0D}";
        "tab.unfocusedActiveModifiedBorder" = "#${hex base0D}";
        "tab.unfocusedInactiveModifiedBorder" = "#${hex base0D}";
        "editorPane.background" = "#${hex base00}";
        "editor.background" = "#${hex base00}";
        "editor.foreground" = "#${hex base05}";
        "editorLineNumber.foreground" = "#${hex base03}";
        "editorLineNumber.activeForeground" = "#${hex base04}";
        "editorCursor.foreground" = "#${hex base05}";
        "editor.selectionBackground" = "#${hex base02}";
        "editor.inactiveSelectionBackground" = "#${hex base02}";
        "editor.selectionHighlightBackground" = "#${hex base01}";
        "editor.wordHighlightBackground" = "#${hex base02}";
        "editor.wordHighlightStrongBackground" = "#${hex base03}";
        "editor.findMatchBackground" = "#${hex base0A}";
        "editor.findMatchHighlightBackground" = "#${hex base09}";
        "editor.findRangeHighlightBackground" = "#${hex base01}";
        "searchEditor.findMatchBackground" = "#${hex base0A}";
        "editor.hoverHighlightBackground" = "#${hex base02}";
        "editor.lineHighlightBackground" = "#${hex base01}";
        "editorLink.activeForeground" = "#${hex base0D}";
        "editor.rangeHighlightBackground" = "#${hex base01}";
        "editorWhitespace.foreground" = "#${hex base03}";
        "editorInlayHint.background" = "#${hex base01}";
        "editorInlayHint.foreground" = "#${hex base05}";
        "editorInlayHint.typeBackground" = "#${hex base01}";
        "editorInlayHint.typeForeground" = "#${hex base05}";
        "editorInlayHint.parameterBackground" = "#${hex base01}";
        "editorInlayHint.parameterForeground" = "#${hex base05}";
        "editorRuler.foreground" = "#${hex base03}";
        "editorCodeLens.foreground" = "#${hex base02}";
        "editorLightBulb.foreground" = "#${hex base0A}";
        "editorLightBulbAutoFix.foreground" = "#${hex base0D}";
        "editorBracketMatch.background" = "#${hex base02}";
        "editorBracketHighlight.foreground1" = "#${hex base08}";
        "editorBracketHighlight.foreground2" = "#${hex base09}";
        "editorBracketHighlight.foreground3" = "#${hex base0A}";
        "editorBracketHighlight.foreground4" = "#${hex base0B}";
        "editorBracketHighlight.foreground5" = "#${hex base0D}";
        "editorBracketHighlight.foreground6" = "#${hex base0E}";
        "editorBracketHighlight.unexpectedBracket.foreground" = "#${hex base0F}";
        "editorOverviewRuler.findMatchForeground" = "#${hex base0A}";
        "editorOverviewRuler.rangeHighlightForeground" = "#${hex base03}";
        "editorOverviewRuler.selectionHighlightForeground" = "#${hex base02}";
        "editorOverviewRuler.wordHighlightForeground" = "#${hex base07}";
        "editorOverviewRuler.wordHighlightStrongForeground" = "#${hex base0D}";
        "editorOverviewRuler.modifiedForeground" = "#${hex base0E}";
        "editorOverviewRuler.addedForeground" = "#${hex base0B}";
        "editorOverviewRuler.deletedForeground" = "#${hex base08}";
        "editorOverviewRuler.errorForeground" = "#${hex base08}";
        "editorOverviewRuler.warningForeground" = "#${hex base0A}";
        "editorOverviewRuler.infoForeground" = "#${hex base0C}";
        "editorOverviewRuler.bracketMatchForeground" = "#${hex base06}";
        "editorError.foreground" = "#${hex base08}";
        "editorWarning.foreground" = "#${hex base0A}";
        "editorInfo.foreground" = "#${hex base0C}";
        "editorHint.foreground" = "#${hex base0D}";
        "problemsErrorIcon.foreground" = "#${hex base08}";
        "problemsWarningIcon.foreground" = "#${hex base0A}";
        "problemsInfoIcon.foreground" = "#${hex base0C}";
        "editorGutter.background" = "#${hex base00}";
        "editorGutter.modifiedBackground" = "#${hex base0E}";
        "editorGutter.addedBackground" = "#${hex base0B}";
        "editorGutter.deletedBackground" = "#${hex base08}";
        "editorGutter.commentRangeForeground" = "#${hex base04}";
        "editorGutter.foldingControlForeground" = "#${hex base05}";
        "diffEditor.insertedTextBackground" = "#${hex base0B}20";
        "diffEditor.removedTextBackground" = "#${hex base08}20";
        "diffEditor.diagonalFill" = "#${hex base02}";
        "editorWidget.foreground" = "#${hex base05}";
        "editorWidget.background" = "#${hex base00}";
        "editorSuggestWidget.background" = "#${hex base01}";
        "editorSuggestWidget.foreground" = "#${hex base05}";
        "editorSuggestWidget.focusHighlightForeground" = "#${hex base07}";
        "editorSuggestWidget.highlightForeground" = "#${hex base0D}";
        "editorSuggestWidget.selectedBackground" = "#${hex base02}";
        "editorSuggestWidget.selectedForeground" = "#${hex base06}";
        "editorHoverWidget.foreground" = "#${hex base05}";
        "editorHoverWidget.background" = "#${hex base00}";
        "debugExceptionWidget.background" = "#${hex base01}";
        "editorMarkerNavigation.background" = "#${hex base01}";
        "editorMarkerNavigationError.background" = "#${hex base08}";
        "editorMarkerNavigationWarning.background" = "#${hex base0A}";
        "editorMarkerNavigationInfo.background" = "#${hex base0D}";
        "editorMarkerNavigationError.headerBackground" = "#${hex base08}20";
        "editorMarkerNavigationWarning.headerBackground" = "#${hex base0A}20";
        "editorMarkerNavigationInfo.headerBackground" = "#${hex base0C}20";
        "peekViewEditor.background" = "#${hex base01}";
        "peekViewEditorGutter.background" = "#${hex base01}";
        "peekViewEditor.matchHighlightBackground" = "#${hex base09}";
        "peekViewResult.background" = "#${hex base00}";
        "peekViewResult.fileForeground" = "#${hex base05}";
        "peekViewResult.lineForeground" = "#${hex base03}";
        "peekViewResult.matchHighlightBackground" = "#${hex base09}";
        "peekViewResult.selectionBackground" = "#${hex base02}";
        "peekViewResult.selectionForeground" = "#${hex base05}";
        "peekViewTitle.background" = "#${hex base02}";
        "peekViewTitleDescription.foreground" = "#${hex base03}";
        "peekViewTitleLabel.foreground" = "#${hex base05}";
        "merge.currentContentBackground" = "#${hex base0D}40";
        "merge.currentHeaderBackground" = "#${hex base0D}40";
        "merge.incomingContentBackground" = "#${hex base0B}60";
        "merge.incomingHeaderBackground" = "#${hex base0B}60";
        "editorOverviewRuler.currentContentForeground" = "#${hex base0D}";
        "editorOverviewRuler.incomingContentForeground" = "#${hex base0B}";
        "editorOverviewRuler.commonContentForeground" = "#${hex base0F}";
        "panel.background" = "#${hex base00}";
        "panel.dropBackground" = "#${hex base01}";
        "panel.dropBorder" = "#${hex base01}";
        "panelTitle.activeForeground" = "#${hex base05}";
        "panelTitle.inactiveForeground" = "#${hex base03}";
        "statusBar.background" = "#${hex base0D}";
        "statusBar.foreground" = "#${hex base07}";
        "statusBar.debuggingBackground" = "#${hex base09}";
        "statusBar.debuggingForeground" = "#${hex base07}";
        "statusBar.noFolderBackground" = "#${hex base0E}";
        "statusBar.noFolderForeground" = "#${hex base07}";
        "statusBarItem.activeBackground" = "#${hex base03}";
        "statusBarItem.hoverBackground" = "#${hex base02}";
        "statusBarItem.prominentForeground" = "#${hex base07}";
        "statusBarItem.prominentBackground" = "#${hex base0E}";
        "statusBarItem.prominentHoverBackground" = "#${hex base08}";
        "statusBarItem.remoteBackground" = "#${hex base0B}";
        "statusBarItem.remoteForeground" = "#${hex base07}";
        "statusBarItem.errorBackground" = "#${hex base08}";
        "statusBarItem.errorForeground" = "#${hex base07}";
        "statusBarItem.warningBackground" = "#${hex base0A}";
        "statusBarItem.warningForeground" = "#${hex base07}";
        "titleBar.activeBackground" = "#${hex base00}";
        "titleBar.activeForeground" = "#${hex base05}";
        "titleBar.inactiveBackground" = "#${hex base01}";
        "titleBar.inactiveForeground" = "#${hex base03}";
        "menubar.selectionForeground" = "#${hex base05}";
        "menubar.selectionBackground" = "#${hex base01}";
        "menu.foreground" = "#${hex base05}";
        "menu.background" = "#${hex base01}";
        "menu.selectionForeground" = "#${hex base05}";
        "menu.selectionBackground" = "#${hex base02}";
        "menu.separatorBackground" = "#${hex base07}";
        "commandCenter.foreground" = "#${hex base05}";
        "commandCenter.activeForeground" = "#${hex base07}";
        "commandCenter.background" = "#${hex base00}";
        "commandCenter.activeBackground" = "#${hex base01}";
        "notificationCenterHeader.foreground" = "#${hex base05}";
        "notificationCenterHeader.background" = "#${hex base01}";
        "notifications.foreground" = "#${hex base05}";
        "notifications.background" = "#${hex base02}";
        "notificationLink.foreground" = "#${hex base0D}";
        "notificationsErrorIcon.foreground" = "#${hex base08}";
        "notificationsWarningIcon.foreground" = "#${hex base0A}";
        "notificationsInfoIcon.foreground" = "#${hex base0D}";
        "notification.background" = "#${hex base02}";
        "notification.foreground" = "#${hex base05}";
        "notification.buttonBackground" = "#${hex base0D}";
        "notification.buttonHoverBackground" = "#${hex base02}";
        "notification.buttonForeground" = "#${hex base07}";
        "notification.infoBackground" = "#${hex base0C}";
        "notification.infoForeground" = "#${hex base07}";
        "notification.warningBackground" = "#${hex base0A}";
        "notification.warningForeground" = "#${hex base07}";
        "notification.errorBackground" = "#${hex base08}";
        "notification.errorForeground" = "#${hex base07}";
        "banner.background" = "#${hex base02}";
        "banner.foreground" = "#${hex base05}";
        "banner.iconForeground" = "#${hex base0D}";
        "extensionButton.prominentBackground" = "#${hex base0B}";
        "extensionButton.prominentForeground" = "#${hex base07}";
        "extensionButton.prominentHoverBackground" = "#${hex base02}";
        "extensionBadge.remoteBackground" = "#${hex base09}";
        "extensionBadge.remoteForeground" = "#${hex base07}";
        "extensionIcon.starForeground" = "#${hex base0A}";
        "extensionIcon.verifiedForeground" = "#${hex base0D}";
        "extensionIcon.preReleaseForeground" = "#${hex base09}";
        "pickerGroup.foreground" = "#${hex base03}";
        "quickInput.background" = "#${hex base01}";
        "quickInput.foreground" = "#${hex base05}";
        "quickInputList.focusBackground" = "#${hex base03}";
        "quickInputList.focusForeground" = "#${hex base07}";
        "quickInputList.focusIconForeground" = "#${hex base07}";
        "keybindingLabel.background" = "#${hex base02}";
        "keybindingLabel.foreground" = "#${hex base05}";
        "keybindingTable.headerBackground" = "#${hex base02}";
        "keybindingTable.rowsBackground" = "#${hex base01}";
        "terminal.background" = "#${hex base00}";
        "terminal.foreground" = "#${hex base05}";
        "terminal.ansiBlack" = "#${hex base00}";
        "terminal.ansiRed" = "#${hex base08}";
        "terminal.ansiGreen" = "#${hex base0B}";
        "terminal.ansiYellow" = "#${hex base0A}";
        "terminal.ansiBlue" = "#${hex base0D}";
        "terminal.ansiMagenta" = "#${hex base0E}";
        "terminal.ansiCyan" = "#${hex base0C}";
        "terminal.ansiWhite" = "#${hex base05}";
        "terminal.ansiBrightBlack" = "#${hex base03}";
        "terminal.ansiBrightRed" = "#${hex base08}";
        "terminal.ansiBrightGreen" = "#${hex base0B}";
        "terminal.ansiBrightYellow" = "#${hex base0A}";
        "terminal.ansiBrightBlue" = "#${hex base0D}";
        "terminal.ansiBrightMagenta" = "#${hex base0E}";
        "terminal.ansiBrightCyan" = "#${hex base0C}";
        "terminal.ansiBrightWhite" = "#${hex base07}";
        "terminalCursor.foreground" = "#${hex base05}";
        "terminalOverviewRuler.cursorForeground" = "#ff0000";
        "terminalOverviewRuler.findMatchForeground" = "#ff0000";
        "debugToolBar.background" = "#${hex base01}";
        "debugView.stateLabelForeground" = "#${hex base07}";
        "debugView.stateLabelBackground" = "#${hex base0D}";
        "debugView.valueChangedHighlight" = "#${hex base0D}";
        "debugTokenExpression.name" = "#${hex base0E}";
        "debugTokenExpression.value" = "#${hex base05}";
        "debugTokenExpression.string" = "#${hex base0B}";
        "debugTokenExpression.boolean" = "#${hex base09}";
        "debugTokenExpression.number" = "#${hex base09}";
        "debugTokenExpression.error" = "#${hex base08}";
        "testing.iconFailed" = "#${hex base08}";
        "testing.iconErrored" = "#${hex base0F}";
        "testing.iconPassed" = "#${hex base0B}";
        "testing.runAction" = "#${hex base04}";
        "testing.iconQueued" = "#${hex base0A}";
        "testing.iconUnset" = "#${hex base04}";
        "testing.iconSkipped" = "#${hex base0E}";
        "testing.peekHeaderBackground" = "#${hex base01}";
        "testing.message.error.decorationForeground" = "#${hex base05}";
        "testing.message.error.lineBackground" = "#${hex base08}20";
        "testing.message.info.decorationForeground" = "#${hex base05}";
        "testing.message.info.lineBackground" = "#${hex base0D}20";
        "welcomePage.background" = "#${hex base00}";
        "welcomePage.buttonBackground" = "#${hex base01}";
        "welcomePage.buttonHoverBackground" = "#${hex base02}";
        "welcomePage.progress.background" = "#${hex base03}";
        "welcomePage.progress.foreground" = "#${hex base0D}";
        "welcomePage.tileBackground" = "#${hex base01}";
        "welcomePage.tileHoverBackground" = "#${hex base02}";
        "walkThrough.embeddedEditorBackground" = "#${hex base00}";
        "gitDecoration.addedResourceForeground" = "#${hex base0B}";
        "gitDecoration.modifiedResourceForeground" = "#${hex base0E}";
        "gitDecoration.deletedResourceForeground" = "#${hex base08}";
        "gitDecoration.renamedResourceForeground" = "#${hex base0C}";
        "gitDecoration.stageModifiedResourceForeground" = "#${hex base0E}";
        "gitDecoration.stageDeletedResourceForeground" = "#${hex base08}";
        "gitDecoration.untrackedResourceForeground" = "#${hex base09}";
        "gitDecoration.ignoredResourceForeground" = "#${hex base03}";
        "gitDecoration.conflictingResourceForeground" = "#${hex base0A}";
        "gitDecoration.submoduleResourceForeground" = "#${hex base0F}";
        "settings.headerForeground" = "#${hex base05}";
        "settings.modifiedItemIndicator" = "#${hex base0D}";
        "settings.modifiedItemForeground" = "#${hex base0B}";
        "settings.dropdownBackground" = "#${hex base01}";
        "settings.dropdownForeground" = "#${hex base05}";
        "settings.checkboxBackground" = "#${hex base01}";
        "settings.checkboxForeground" = "#${hex base05}";
        "settings.rowHoverBackground" = "#${hex base02}";
        "settings.textInputBackground" = "#${hex base01}";
        "settings.textInputForeground" = "#${hex base05}";
        "settings.numberInputBackground" = "#${hex base01}";
        "settings.numberInputForeground" = "#${hex base05}";
        "settings.focusedRowBackground" = "#${hex base02}";
        "settings.headerBorder" = "#${hex base05}";
        "settings.sashBorder" = "#${hex base05}";
        "breadcrumb.foreground" = "#${hex base05}";
        "breadcrumb.background" = "#${hex base01}";
        "breadcrumb.focusForeground" = "#${hex base06}";
        "breadcrumb.activeSelectionForeground" = "#${hex base07}";
        "breadcrumbPicker.background" = "#${hex base01}";
        "editor.snippetTabstopHighlightBackground" = "#${hex base02}";
        "editor.snippetFinalTabstopHighlightBackground" = "#${hex base03}";
        "symbolIcon.arrayForeground" = "#${hex base05}";
        "symbolIcon.booleanForeground" = "#${hex base09}";
        "symbolIcon.classForeground" = "#${hex base0A}";
        "symbolIcon.colorForeground" = "#${hex base05}";
        "symbolIcon.constantForeground" = "#${hex base09}";
        "symbolIcon.constructorForeground" = "#${hex base0D}";
        "symbolIcon.enumeratorForeground" = "#${hex base09}";
        "symbolIcon.enumeratorMemberForeground" = "#${hex base0D}";
        "symbolIcon.eventForeground" = "#${hex base0A}";
        "symbolIcon.fieldForeground" = "#${hex base08}";
        "symbolIcon.fileForeground" = "#${hex base05}";
        "symbolIcon.folderForeground" = "#${hex base05}";
        "symbolIcon.functionForeground" = "#${hex base0D}";
        "symbolIcon.interfaceForeground" = "#${hex base0D}";
        "symbolIcon.keyForeground" = "#${hex base05}";
        "symbolIcon.keywordForeground" = "#${hex base0E}";
        "symbolIcon.methodForeground" = "#${hex base0D}";
        "symbolIcon.moduleForeground" = "#${hex base05}";
        "symbolIcon.namespaceForeground" = "#${hex base05}";
        "symbolIcon.nullForeground" = "#${hex base0F}";
        "symbolIcon.numberForeground" = "#${hex base09}";
        "symbolIcon.objectForeground" = "#${hex base05}";
        "symbolIcon.operatorForeground" = "#${hex base05}";
        "symbolIcon.packageForeground" = "#${hex base05}";
        "symbolIcon.propertyForeground" = "#${hex base05}";
        "symbolIcon.referenceForeground" = "#${hex base05}";
        "symbolIcon.snippetForeground" = "#${hex base05}";
        "symbolIcon.stringForeground" = "#${hex base0B}";
        "symbolIcon.structForeground" = "#${hex base0A}";
        "symbolIcon.textForeground" = "#${hex base05}";
        "symbolIcon.typeParameterForeground" = "#${hex base05}";
        "symbolIcon.unitForeground" = "#${hex base05}";
        "symbolIcon.variableForeground" = "#${hex base08}";
        "debugIcon.breakpointForeground" = "#${hex base08}";
        "debugIcon.breakpointDisabledForeground" = "#${hex base04}";
        "debugIcon.breakpointUnverifiedForeground" = "#${hex base02}";
        "debugIcon.breakpointCurrentStackframeForeground" = "#${hex base0A}";
        "debugIcon.breakpointStackframeForeground" = "#${hex base0F}";
        "debugIcon.startForeground" = "#${hex base0B}";
        "debugIcon.pauseForeground" = "#${hex base0D}";
        "debugIcon.stopForeground" = "#${hex base08}";
        "debugIcon.disconnectForeground" = "#${hex base08}";
        "debugIcon.restartForeground" = "#${hex base0B}";
        "debugIcon.stepOverForeground" = "#${hex base0D}";
        "debugIcon.stepIntoForeground" = "#${hex base0C}";
        "debugIcon.stepOutForeground" = "#${hex base0E}";
        "debugIcon.continueForeground" = "#${hex base0B}";
        "debugIcon.stepBackForeground" = "#${hex base0F}";
        "debugConsole.infoForeground" = "#${hex base05}";
        "debugConsole.warningForeground" = "#${hex base0A}";
        "debugConsole.errorForeground" = "#${hex base08}";
        "debugConsole.sourceForeground" = "#${hex base05}";
        "debugConsoleInputIcon.foreground" = "#${hex base05}";
        "notebook.editorBackground" = "#${hex base00}";
        "notebook.cellBorderColor" = "#${hex base03}";
        "notebook.cellHoverBackground" = "#${hex base01}";
        "notebook.cellToolbarSeparator" = "#${hex base02}";
        "notebook.cellEditorBackground" = "#${hex base00}";
        "notebook.focusedCellBackground" = "#${hex base02}";
        "notebook.focusedCellBorder" = "#${hex base0D}";
        "notebook.focusedEditorBorder" = "#${hex base0D}";
        "notebook.inactiveFocusedCellBorder" = "#${hex base03}";
        "notebook.selectedCellBackground" = "#${hex base02}";
        "notebookStatusErrorIcon.foreground" = "#${hex base08}";
        "notebookStatusRunningIcon.foreground" = "#${hex base0C}";
        "notebookStatusSuccessIcon.foreground" = "#${hex base0B}";
        "charts.foreground" = "#${hex base05}";
        "charts.lines" = "#${hex base05}";
        "charts.red" = "#${hex base08}";
        "charts.blue" = "#${hex base0D}";
        "charts.yellow" = "#${hex base0A}";
        "charts.orange" = "#${hex base09}";
        "charts.green" = "#${hex base0B}";
        "charts.purple" = "#${hex base0E}";
        "ports.iconRunningProcessForeground" = "#${hex base09}";
      };
      "editor.tokenColorCustomizations" = {
        comments = "#${hex base03}";
        functions = "#${hex base0D}";
        keywords = "#${hex base0E}";
        numbers = "#${hex base09}";
        strings = "#${hex base0B}";
        types = "#${hex base0A}";
        variables = "#${hex base06}";
      };
    };
  };
}