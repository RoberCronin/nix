{
    pkgs,
    wvkbd,
    killall,
    ...
}:
pkgs.writeShellScriptBin "wvkbd-toggle" ''
    PIDs="$(pgrep -x wvkbd-mobintl)"
    if [  -z "$PIDs" ]; then
      ${wvkbd}/bin/wvkbd-mobintl -L 300
    else
      ${killall}/bin/killall -34 wvkbd-mobintl
    fi
''
