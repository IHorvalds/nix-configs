{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    keybindings = [
      {
        command = "workbench.action.focusRightGroup";
        key = "ctrl+w RightArrow";
      }

      {
        command = "workbench.action.focusLeftGroup";
        key = "ctrl+w LeftArrow";
      }

      {
        command = "workbench.action.focusAboveGroup";
        key = "ctrl+w UpArrow";
      }

      {
        command = "workbench.action.focusBelowGroup";
        key = "ctrl+w DownArrow";
      }

      {
        command = "workbench.action.focusActiveEditorGroup";
        key = "ctrl+alt+e";
      }
    ];
  };
}
