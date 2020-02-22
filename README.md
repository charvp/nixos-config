## NixOS config

# Setting up a new dev environment

* Create a new `*.nix` file in the shells directory that describes the environment (this is the hard part).

* Execute `lorri init` in the base directory of your project. This will create a `.envrc` file and `shell.nix` file.

* Edit the `shell.nix` file so that it contains `import /path/to/this/repo/shells/your-new-file.nix`.

* Execute `direnv allow` to load the `.envrc` file which in turn uses `lorri` to load your `shell.nix` file.