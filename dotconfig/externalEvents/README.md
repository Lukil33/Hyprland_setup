Hey, per far funzionare il file check_lid.sh bisogna prima creare il file /etc/udev/rules.d/99-hypr-lid.rules ed inserire SUBSYSTEM=="button", KERNEL=="lid*", RUN+="/home/lukil/.config/hypr/script/check_lid.sh"


COSE DA FARE:

cerca di capire come fare funzionare da acpid il modulo check_lid
cerca di capire come fare funzionare da acpid il modulo check_power_supply

aggiungi il tutto su git hub