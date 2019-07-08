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
	
	
getdunst:
	if [ ! -d "$(DUEHOANG)/dunst" ]; then \
		git clone https://github.com/dunst-project/dunst.git $(DUEHOANG)/dunst \
		xbps-install -S \
		dbus \
		libXinerama-devel \
		libXrandr-devel \
		libXScrnSaver-devel \
		glib-devel \
		pango-devel \
		cairo-devel \
		gtk+3-devel; \
	fi
	
getpowertop:
	xbps-install -S powertop

init: dwm getdunst getpowertop
	ln -vsf $(CURDIR)/.xinitrc $(DUEHOANG)/.xinitrc
	ln -vsf $(CURDIR)/dwm/config.h $(DUEHOANG)/dwm/config.h
	ln -vsf $(CURDIR)/grub /etc/default/grub
	ln -vsf $(CURDIR)/startdwm $(DUEHOANG)/dwm/startdwm
	chmod +x $(CURDIR)/startdwm
	ln -vsf $(CURDIR)/97-powertop.sh /etc/runit/core-services/97-powertop.sh
	chmod +x $(CURDIR)/97-powertop.sh
	ln -vsf $(CURDIR)/.profile $(DUEHOANG)/.profile
	mkdir -p $(DUEHOANG)/.config/dunst
	ln -vsf $(CURDIR)/dunst/dunstrc $(DUEHOANG)/.config/dunst

.PHONY: init getdwm getdunst getpowertop
