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

init: getdwm
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
	ln -vsf $(CURDIR)/refind.conf /boot/efi/EFI/refind/refind.conf
	chmod +x $(CURDIR)/refind.conf

.PHONY: init getdwm
