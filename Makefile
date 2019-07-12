DUEHOANG := /home/jzhang268

getdwm:
	if [ ! -d "$(DUEHOANG)/dwm" ]; then \
		git clone git://git.suckless.org/dwm $(DUEHOANG)/dwm \
		xbps-install -S \
		dmenu \
		libX11-devel \
		libXinerama-devel \
		freetype-devel; \
	fi

getzzz:
	if [ ! -d "$(DUEHOANG)/zzz-user-hooks" ]; then \
		git clone https://github.com/bahamas10/zzz-user-hooks.git $(DUEHOANG)/zzz-user-hooks ; \
	fi
		

install: getdwm getzzz
	ln -vsf $(CURDIR)/.xinitrc $(DUEHOANG)/.xinitrc
	ln -vsf $(CURDIR)/dwm/config.h $(DUEHOANG)/dwm/config.h
	ln -vsf $(CURDIR)/grub /etc/default/grub
	ln -vsf $(CURDIR)/startdwm $(DUEHOANG)/dwm/startdwm
	chmod +x $(CURDIR)/startdwm
	ln -vsf $(CURDIR)/97-powertop.sh /etc/runit/core-services/97-powertop.sh
	chmod +x $(CURDIR)/97-powertop.sh
	ln -vsf $(CURDIR)/.profile $(DUEHOANG)/.profile
	ln -vsf $(CURDIR)/dunstrc $(DUEHOANG)/.config/dunst/dunstrc
	ln -vsf $(CURDIR)/compton.conf $(DUEHOANG)/.config/compton/compton.conf
	ln -vsf $(CURDIR)/libinput-gestures.conf $(DUEHOANG)/.config/libinput-gestures.conf
	ln -vsf $(CURDIR)/sakura.conf $(DUEHOANG)/.config/sakura/sakura.conf
	chmod +x $(CURDIR)/refind.conf
	cp $(CURDIR)/refind.conf /boot/efi/EFI/refind/refind.conf
	ln -vsf $(CURDIR)/i3/config $(DUEHOANG)/.config/i3/config
	ln -vsf $(CURDIR)/.onsuspend $(DUEHOANG)/.onsuspend
	chmod +x $(CURDIR)/.onsuspend
	ln -vsf $(CURDIR)/.onresume $(DUEHOANG)/.onresume
	chmod +x $(CURDIR)/.onresume
	ln -vsf $(CURDIR)/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
	ln -vsf $(CURDIR)/i3blocks/config $(DUEHOANG)/.config/i3blocks/config
	ln -vsf $(CURDIR)/.vim $(DUEHOANG)/.vim
	ln -vsf $(CURDIR)/compton-tryone144.conf $(DUEHOANG)/.config/compton.conf

.PHONY: install getdwm getzzz
