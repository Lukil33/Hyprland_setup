Limiti delle soluzioni implementate:

### MODULO 'monitor'
 - Il passaggio dalla modalità di mirroring dello schermo a quella di spostamento dello schermo presenta ancora gravi mancanze in quanto bisogna ricaricare completamente l'interfaccia intera

### MODULO 'move-monitor'
 - All'interno del modulo 'move-monitor' la dimensione della quale vengono spostati i vari schermi è hardcodata e non varia in base allo schermo
 - gli schermi vengono posizioni tutti quanti in ordine a destra, sinistra, sopra e sotto rispetto allo schermo del portatile, tale soluzione è abbastanza riduttiva nel momento in cui si anno più monitor collegati

### MODULO 'reload-monitor'
 - Il codice non è male, però non sono riuscito a fare in modo che il tutto avvenga in modo automatico quando il coperchio del computer portatile viene chiuso