The source files are assembled into a rom using [**rgbds**](https://github.com/rednex/rgbds).
These instructions explain how to set up the tools required to build.

If you run into trouble, ask on irc ([**freenode#pret**](https://kiwiirc.com/client/irc.freenode.net/?#pret)).


# NOTICE

Currently building requires that you provide a base ROM for both versions. You can find the md5 for each version in [README.md](README.md) to confirm you have the right one.

You will need to rename the Gold ROM to **baserom-gold.gbc** and the Silver ROM to **baserom-silver.gbc** in order to build either version.


# Linux

Python 2.7 is required.

```bash
sudo apt-get install make gcc bison git python

git clone https://github.com/rednex/rgbds
cd rgbds
sudo make install
cd ..

git clone --recursive https://github.com/pret/pokegold
cd pokegold
```

To build **pokegold.gbc**:

```bash
make gold
```

To build **pokesilver.gbc**:

```bash
make silver
```

To build both ROMs:

```bash
make
```


# Mac

In **Terminal**, run:

```bash
xcode-select --install

git clone https://github.com/rednex/rgbds
cd rgbds
sudo make install
cd ..

git clone --recursive https://github.com/pret/pokegold
cd pokegold
```

To build **pokegold.gbc**:

```bash
make gold
```

To build **pokesilver.gbc**:

```bash
make silver
```

To build both ROMs:

```bash
make
```


# Windows

To build on Windows, install [**Cygwin**](http://cygwin.com/install.html) with the default settings.

In the installer, select the following packages: `make` `git` `python`

Then get the most recent version of [**rgbds**](https://github.com/rednex/rgbds/releases/).
Extract the archive and put `rgbasm.exe`, `rgblink.exe` and `rgbfix.exe` in `C:\cygwin64\usr\local\bin`.

In the **Cygwin terminal**:

```bash

git clone --recursive https://github.com/pret/pokegold
cd pokegold
```

To build **pokegold.gbc**:

```bash
make gold
```

To build **pokesilver.gbc**:

```bash
make silver
```

To build both ROMs:

```bash
make
```
