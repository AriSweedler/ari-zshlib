# ari-zshlib: Ari's shell library as one directory, lib/: log.zsh (logging, with its notification
# icon), logging.zsh, dry_run.zsh, await.zsh, run_with_timeout.zsh, investigation_folder.zsh,
# strip_ansi.zsh, log_rotate.zsh, and the bash pair log.bash and arg.bash.
# A mirror: the files are written in Ari's dotfiles and exported here.
{
  description = "Ari's zsh and bash script library";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let
      systems = [ "aarch64-darwin" "x86_64-darwin" "aarch64-linux" "x86_64-linux" ];
      each = f: nixpkgs.lib.genAttrs systems (s: f nixpkgs.legacyPackages.${s});
    in
    {
      # $out/lib holds the library; source "$out/lib/logging.zsh".
      packages = each (pkgs: {
        default = pkgs.runCommand "ari-zshlib" { } "mkdir -p $out && cp -R ${./lib} $out/lib";
      });
    };
}
