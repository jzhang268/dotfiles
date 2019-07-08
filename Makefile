clonedwm:
  git clone git://git.suckless.org/dwm ~/dwm

init:
  ln -vsf $(CURDIR)/,xinitrc ~/.xinitrc
  if [ ! -d "~/dwm" ]; then \
     clonedwm \
  fi
  ln -vsf $(CURDIR)/dwm/config.h ~/dwm/config.h
  ln -vsf $(CURDIR)/grub /etc/default/grub
  ln -vsf $(CURDIR)/startdwm ~/dwm/startdwm

.PHONY: checkdwm init
