The source files are assembled into a rom using [**rgbds**](https://github.com/bentley/rgbds).
These instructions explain how to set up the tools required to build.

If you run into trouble, ask on irc ([**freenode#pret**](https://kiwiirc.com/client/irc.freenode.net/?#pret)).


# NOTICE

Currently the repository requires prebuilt copies of Pokémon Gold and Pokémon Silver.  You can find their MD5sums in README.md.  Due to legal issues, we are unable to provide direct links to these ROMs, but a quick Google search should point you in the right direction.

You will need to rename the GOLD ROM to **baserom-gold.gbc** and the SILVER ROM to **baserom-silver.gbc** in order to build the respective version of the game.

# Linux

Python 2.7 is required.

```bash
sudo apt-get install make gcc bison git python

git clone https://github.com/bentley/rgbds
cd rgbds
sudo make install
cd ..

git clone --recursive https://github.com/pikalaxalt/pokegold
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

git clone https://github.com/bentley/rgbds
cd rgbds
sudo make install
cd ..

git clone --recursive https://github.com/pikalaxalt/pokegold
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

In the installer, select the following packages: `make` `git` `python` `gettext`

Then get the most recent version of [**rgbds**](https://github.com/bentley/rgbds/releases/).
Extract the archive and put `rgbasm.exe`, `rgblink.exe` and `rgbfix.exe` in `C:\cygwin64\usr\local\bin`.

In the **Cygwin terminal**:

```bash

git clone --recursive https://github.com/pikalaxalt/pokegold
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

## notes

- If `gettext` no longer exists, grab `libsasl2-3` `ca-certificates`.
