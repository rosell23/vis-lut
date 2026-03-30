# lut-theme

![lut opening a its own theme file and a C file from the [anntp](https://scm.mariorosell.es/anntp) library](lut.png)

A [vis](https://github.com/martanne/vis) theme inspired by Vim's builtin desert theme, and Gruvbox's olive green, heavily modified to my liking :).

## Usage

Just do:

~~~bash
% mkdir -p ~/.config/vis/themes/
% wget https://raw.githubusercontent.com/rosell23/vis-lut/refs/heads/main/themes/vis.lua ~/.config/vis/themes/vis.lua
~~~

And add this to your `visrc.lua`:

~~~lua
vis:command("set theme lut")
~~~

## License

CC0. See the [LICENSE](./LICENSE) file for more.
