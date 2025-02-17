# zvm (Zig Version Manager)

zvm is a tool for managing your Zig installs. With std under heavy development and a 
large feature roadmap, Zig is bound to continue changing. Breaking existing builds, updating 
valid sytax, and introducing new features like a package manager. While this is great for developers, it also
can lead to headaches when you need multiple versions of a language installed to compile your projects.

## Requirements
`zvm` is pre-alpha software, and makes no guarentees about its stability until at least v0.1.0. However, the program is under constant development, and the author is very willing to work with contributors. If you have any issues, ideas, or contributions you'd like to suggest create a GitHub issue. 

<hr>

### Linux (Primary Development Target)
#### Ubuntu/Debian
1. libcurl - `sudo apt install libcurl-dev` (Follow your package manger's instructions)
2. `tar` on your $PATH
3. `zig build -Drelease-safe`
4. Enjoy

### Windows
1. cURL should already be installed, but [in case it isn't](https://stackoverflow.com/questions/9507353/how-do-i-install-and-use-curl-on-windows).
2. Just run `zig build -Drelease-safe`. 
> I haven't been able to get it to compile on Windows yet myself. I'm not sure if it's an issue with my machine or what. I'll update it here as progress is made

## Building
1. `git clone --recursive -j8 git@github.com:tristanisham/zvm.git`
3. `zig build -Drelease-safe`
4. Enjoy

## Using
Pre-alpha, you can install each zig version by name.
```sh
zvm install master
```

zvm will determine version is appropriate for your system and currently, write it in '~/.zvm/{s}`. This behavior will change and future version of zvm will install in a dedicated folder, using symlinks to manager your version of Zig.



## Contributing

Contributions are always welcome! This project is super young, which means if you join in now
you'll make a massive difference. I'm still learning more about zig every day, and could use help making sure the program is reliable and fast.

Start by looking for issues, or by creating new ones. The current plan is to match [nvm](https://github.com/nvm-sh/nvm/blob/master/README.md)'s API, 
so if you see a missing feature start there!


## License

The MIT License (MIT)
Copyright © 2022 Tristan Isham

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
