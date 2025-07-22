I seguenti moduli custom sono stati in parte programmati da me (Battery e Volume) e in parte sono stati presi online (Bluetooth). 

Al fine di riuscire ad utilizzare i seguenti moduli è necessario utilizzare il comando "chmod +x rofi-nome_del_modulo", per fare in modo di renderlo un eseguibile.

Al fine di riuscire ad utilizzare al meglio il modulo Battery è necessario applicare il comando: "tuo_utente ALL=(ALL) NOPASSWD: /usr/bin/tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor", in modo da poter effettuare il cambio di governor senza il bisogno di inserire alcuna password.