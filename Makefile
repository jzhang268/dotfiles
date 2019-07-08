DUEHOANG := /home/jzhang268

init:
	ln -vsf $(CURDIR)/,xinitrc $(DUEHOANG)/.xinitrc
	if [ ! -d "$(DUEHOANG)/dwm" ]; then git clone git://git.suckless.org/dwm $(DUEHOANG)/dwm; fi
	ln -vsf $(CURDIR)/dwm/config.h $(DUEHOANG)/dwm/config.h
	ln -vsf $(CURDIR)/grub /etc/default/grub
	ln -vsf $(CURDIR)/startdwm $(DUEHOANG)/dwm/startdwm
	chmod +x $(CURDIR)/startdwm
	ln -vsf $(CURDIR)/97-powertop.sh /etc/runit/core-services/97-powertop.sh
	chmod +x $(CURDIR)/97-powertop.sh

.PHONY: all init
