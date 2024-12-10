{ sources ? import ./npins/default.nix }:
let
  pkgs = import sources.nixpkgs { config = {}; overlays = []; };
  defaultBuild = pkgs.callPackage ./. { };
  shell = pkgs.mkShell {
    inputsFrom = [ ];
    packages = with pkgs; [
      conan
      cmake
      meson
      pkg-config
      ninja
      clang-tools
      clang-analyzer
      clang
      gdb

      (imgui.override { IMGUI_BUILD_GLFW_BINDING = false; })
      implot
      SDL2
      libGL
    ];

    hardeningDisable = ["all"];

    shellHook = ''
      export LD_LIBRARY_PATH=${pkgs.libGL}/lib/
      ln -fs ./build/compile_commands.json compile_commands.json
    '';
  };
in
{
  inherit shell;
}
