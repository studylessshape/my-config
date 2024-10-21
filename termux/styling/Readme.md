# Termux Style
This directory is the config of [Termux](https://github.com/termux/termux-app).

I'd like to use the [f-droid](https://f-droid.org/en/packages/com.termux/) version.

## Description
There are some important file from wiki or open source project.

- **font.ttf**: set the font of Termux. Where the font from is [NERD FONTS](https://www.nerdfonts.com/) and the font is `0xProto`. Why I use this font is the nvim that needs this font to display icons.
- **termux.properties**: The most important is the [Touch Keyboard](https://wiki.termux.com/wiki/Touch_Keyboard). I add some brackets chars for coding.

## Usage
You can copy these files to `~/.termux` by commands below:

```shell
cp ./* ~/.termux/*
```

> [!WARNING]
> Adjust to backup your own config files before copy files.
