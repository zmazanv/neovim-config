{
  lib,
  pkgs,
}: let
  pkgResolve = x:
    if (lib.isList x)
    then (lib.map pkgResolve x)
    else if (lib.isString x)
    then let
      walk = a: b: a.${b};
      atts = lib.splitString "." x;
    in
      lib.foldl' walk pkgs atts
    else (builtins.abort "Invalid type provided: '${lib.typeOf x}'");
in {
  default = let
    packages = {
      git = [
        "git"
      ];
      lua = [
        "lua"
        "lua-language-server"
        "stylua"
      ];
      json = [
        "vscode-langservers-extracted"
      ];
      markdown = [
        "marksman"
        "nodePackages.prettier"
      ];
      nix = [
        "alejandra"
        "deadnix"
        "nil"
        "statix"
      ];
    };
  in
    pkgs.mkShellNoCC {
      name = "neovim-config";

      packages = lib.concatMap pkgResolve (lib.attrValues packages);

      shellHook = ''
        [[ -f ./TO-DO.md ]] && ${lib.getExe pkgs.glow} -- ./TO-DO.md
      '';

      DIRENV_LOG_FORMAT = "";
    };
}
