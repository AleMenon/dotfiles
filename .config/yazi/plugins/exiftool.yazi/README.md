# exiftool.yazi

This is a Yazi plugin for previewing executable files. It shows extra informations using `exiftool`.

## Preview  

- ELF file

![ELF file](./images/exiftool_elf.png) 

- EXE file

![EXE file](./images/exiftool_exe.png) 

## Installation

- Install exiftool:

```bash
# Arch command
sudo pacman -Syu
sudo pacman -S exiftool
```

- Install this plugin:

```bash
ya pkg add AleMenon/exiftool
``` 

## Usage

Add the following to your yazi.toml:

```toml
[plugin]
prepend_previewers = [
    { mime = "*executable*",   run = "exiftool" }
]
```
