# dotties

These are some of the configuration files from software that I use on a regular basis. I will be adding more (or changing the existing ones) when it makes sense. Here is a brief description of my setup:

- OS: Gentoo Linux
- Window Manager: i3
- Terminal emulator: URxvt (or `rxvt-unicode`, if you prefer)
- Shell: Bash
- Editor: Vim

# Gentoo's configuration

Some of the most important configurations can be found under `etc/{conf.d,init.d,portage}`. One particularfile to look at is `make.conf`. This file contains important variables that are used by Portage, which is essentially the heart of Gentoo.

### IPTables firewall

Even though `nftables` are the successor, I still use IPTables for my firewall rules. These can be found in `etc/iptables/rules.sh`.

### libinput

I'm using `libinput` to handle my input devices, such as keyboard and touchpad. Under `etc/X11/xorg.conf.d/` you can find a simple configuration that enables **NaturalScrolling** and **HorizontalScrolling** on my touch pad. I also increased the acceleration slightly.

### Kernel modules

Under `etc/modprobe.d` you can find a file with blacklisted Kernel modules. For instance, I'm not interested in having the PC Speaker shouting at me every time I press tab.
Also, under `etc/modules-load.d/` there are a bunch of confiuration files that describe the necessary Kernel modules for the corresponding software (e.g. `virtualbox.conf` has a list of Kernel modules that it needs).

# i3 Window Manager

I decided to move away from KDE Plasma, since it was constantly keeping my CPU fan busy and consuming more resources than I've wanted. I was in doubt between going back to Fluxbox or trying out i3. I opted for i3, which has been a pleasant experience so far. Its main configuration lives under `.i3/config`. I'm still learning the ins and outs of **i3**, so probably this file will change substantially in the future.
Other important files are `.xinitrc`, `.Xprofile` and `.Xresources`.

# URxvt

Since I moved away from KDE (and from Konsole), I needed to fine a nice terminal emulator that would be lean, easi to configure and provided nice support for UTF-8. I noticed that many folks use URxvt, so I decided to give it a try. So far, so good. Pretty easy to configure and the resources footprint is damn low. Most of its configuration lives in `.Xresources`.
