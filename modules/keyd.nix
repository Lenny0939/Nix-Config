{...}: let
  canary = [
    "w"
    "l"
    "y"
    "p"
    "k"
    "z"
    "x"
    "o"
    "u"
    ";"
    "c"
    "r"
    "s"
    "t"
    "b"
    "f"
    "n"
    "e"
    "i"
    "a"
    "'"
    "j"
    "v"
    "d"
    "g"
    "q"
    "m"
    "h"
    "/"
    ","
    "."
  ];
  recurva = [
    "f"
    "r"
    "d"
    "p"
    "v"
    "q"
    "j"
    "u"
    "o"
    "y"
    "s"
    "n"
    "t"
    "c"
    "b"
    "."
    "h"
    "e"
    "a"
    "i"
    "/"
    "x"
    "k"
    "g"
    "w"
    "z"
    "m"
    "l"
    ";"
    "'"
    ","
  ];
in {
  services.keyd = {
    keyboards."laptop" = {
      ids = ["0001:0001"];
      settings = {
        main = {
          rightalt = "layer(raise)";
          leftalt = "oneshot(alt)";
          rightcontrol = "toggle(canary)";
          #capslock = "C-backspace";
          capslock = "backspace";
        };
        recurva = {
          q = builtins.elemAt recurva 0;
          w = builtins.elemAt recurva 1;
          e = builtins.elemAt recurva 2;
          r = builtins.elemAt recurva 3;
          t = builtins.elemAt recurva 4;
          y = builtins.elemAt recurva 5;
          u = builtins.elemAt recurva 6;
          i = builtins.elemAt recurva 7;
          o = builtins.elemAt recurva 8;
          p = builtins.elemAt recurva 9;
          a = builtins.elemAt recurva 10;
          s = builtins.elemAt recurva 11;
          d = builtins.elemAt recurva 12;
          f = builtins.elemAt recurva 13;
          g = builtins.elemAt recurva 14;
          h = builtins.elemAt recurva 15;
          j = builtins.elemAt recurva 16;
          k = builtins.elemAt recurva 17;
          l = builtins.elemAt recurva 18;
          ";" = builtins.elemAt recurva 19;
          "'" = builtins.elemAt recurva 20;
          z = builtins.elemAt recurva 21;
          x = builtins.elemAt recurva 22;
          c = builtins.elemAt recurva 23;
          v = builtins.elemAt recurva 24;
          b = builtins.elemAt recurva 25;
          n = builtins.elemAt recurva 26;
          m = builtins.elemAt recurva 27;
          "," = builtins.elemAt recurva 28;
          "." = builtins.elemAt recurva 29;
          "/" = builtins.elemAt recurva 30;
          rightcontrol = "toggle(canary)";
        };
        canary = {
          q = builtins.elemAt canary 0;
          w = builtins.elemAt canary 1;
          e = builtins.elemAt canary 2;
          r = builtins.elemAt canary 3;
          t = builtins.elemAt canary 4;
          y = builtins.elemAt canary 5;
          u = builtins.elemAt canary 6;
          i = builtins.elemAt canary 7;
          o = builtins.elemAt canary 8;
          p = builtins.elemAt canary 9;
          a = builtins.elemAt canary 10;
          s = builtins.elemAt canary 11;
          d = builtins.elemAt canary 12;
          f = builtins.elemAt canary 13;
          g = builtins.elemAt canary 14;
          h = builtins.elemAt canary 15;
          j = builtins.elemAt canary 16;
          k = builtins.elemAt canary 17;
          l = builtins.elemAt canary 18;
          ";" = builtins.elemAt canary 19;
          "'" = builtins.elemAt canary 20;
          z = builtins.elemAt canary 21;
          x = builtins.elemAt canary 22;
          c = builtins.elemAt canary 23;
          v = builtins.elemAt canary 24;
          b = builtins.elemAt canary 25;
          n = builtins.elemAt canary 26;
          m = builtins.elemAt canary 27;
          "," = builtins.elemAt canary 28;
          "." = builtins.elemAt canary 29;
          "/" = builtins.elemAt canary 30;
          rightcontrol = "toggle(recurva)";
        };
        qwerty = {
          q = "q";
          w = "w";
          e = "e";
          r = "r";
          t = "t";
          y = "y";
          u = "u";
          i = "i";
          o = "o";
          p = "p";
          a = "a";
          s = "s";
          d = "d";
          f = "f";
          g = "g";
          h = "h";
          j = "j";
          k = "k";
          l = "l";
          ";" = ";";
          z = "z";
          x = "x";
          c = "c";
          v = "v";
          b = "b";
          n = "n";
          m = "m";
          "," = ",";
          "." = ".";
          "/" = "/";
        };
        "alt:A" = {
          q = "A-q";
          w = "A-w";
          e = "A-e";
          r = "A-r";
          t = "A-t";
          y = "A-y";
          u = "A-u";
          i = "A-i";
          o = "A-o";
          p = "A-p";
          a = "A-a";
          s = "A-s";
          d = "A-d";
          f = "A-f";
          g = "A-g";
          h = "A-h";
          j = "A-j";
          k = "A-k";
          l = "A-l";
          ";" = "A-;";
          z = "A-z";
          x = "A-x";
          c = "A-c";
          v = "A-v";
          b = "A-b";
          n = "A-n";
          m = "A-m";
          "," = "A-,";
          "." = "A-.";
          "/" = "A-/";
        };
        raise = {
          h = "left";
          j = "down";
          k = "up";
          l = "right";
          capslock = "escape";
        };
      };
    };
  };
}
