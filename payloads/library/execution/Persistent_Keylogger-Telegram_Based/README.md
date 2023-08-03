# Persistent Keylogger - Telegram Based

A script used to configure a persistent keylogger on a Linux computer trough a pre-configured Telegram Bot.

**Category**: Execution

## Dependencies

* Internet Connection

## Description

A script used to configure a persistent keylogger on a Linux computer trough a pre-configured Telegram Bot.

This payload is based on [Telegram Persistent Connection](Telegram_Persistent_Connection) payload for create the Telegram connection.

Nello script potete trovare due classi che ereditano Thread chiamate Keylogger e Sender ed una classe di memoria condivisa chiamata Log. Le classi Thread svolgono due compiti distinti:
- Keylogger: La classe Keylogger si occupa di acquisire, tramite la librearia keyboard, i tasti premuti e in funzione di questo rilevamente viene invocata la funzione callback opportunamente modificata e indicata nel richiamo della funzione. Quando viene rilevato l'utilizzo di un certo tasto da tastiera viene di seguito aggiunto alla variabile di log tramite il metodo `add_to_log()` dell'oggetto `self.log` della classe `Log`.
- Sender: La classe Sender rappresenta un thread che si occupa solo ed esclusivamente di invocare periodicamente il metodo `send_log()` dell'oggetto `self.log` della classe `Log`.
- Log: La classe Log rappresenta una entità a memoria condivisa. La memoria condivisa è la variabile `self.log` che periodicamente viene gestita tramite i metodi `add_to_log()` e `send_log()`. Questa classe è stata ideata con l'obiettivo di evitare la perdita di dati e per tanto si è pensato di applicare un sistema di gestione dei lock affinché se un utente dovesse scrivere molto velocemente non si creino situazioni spiacevoli o inaspettate. Al fine di gestire i lock è stato deciso di utilizzare `RLock` e `Condition` rispettivamente nei metodi della classe. Il metodo `add_to_log(self, log)` si occupa di acquisire il lock tramite l'invocazione `with self.lock` e di aggiornare la variabile interna con il nuovo carattere ricevuto. Dal momento che come condizione di attesa sulla gestione dei lock vi è solo quella in cui la variabile self.lock sia vuota allora subito dopo l'aggiornamento della variabile interna viene invocata la funzione sbloccante `self.condition.notify_all()` che permette a tutti i Thread (in questo caso in realtà solo 1, il Sender) di svegliarsi e di procedere con l'operazione di invio. Il metodo `send_log(self)` si occupa di acquisire il lock e di porsi in condizione di attesa tramite il comando `self.condition.wait()` nel caso in cui la variabile self.log risulti vuota. Una volta riaquisito il lock, in seguito ad un risveglio, il Thread Sender procederà con l'invio del messaggio tramite comando `bot.send_message(...)` riportando ad uno stato iniziale vuoto la variabile self.log. E' bene sottolineare che seppure questo bot Telegram potrebbe essere utilizzato da chiunque in maniera dinamica, potrebbe essere una buona usanza utilizzare l'ID in maniera statica (riga 16 del file Python) in quanto il ricevente dei messaggi sarete sempre voi e non qualcun'altro (almeno non dovrebbe essere così). Questo aspetto può risultare poco sicuro in quanto rilasciate una informazione molto sensibile e delicata per quanto riguarda la vostra riservatezza e la vostra identità, ma dal momento che questo script non è assolutamente pensato ai fini malevoli o in ambiti reali, bensì è stato pensato e creato ai fini di studio.

Because Telegram uses a limited size per message, the script divides the output of the command into a theoretically infinite chunk of 1000 characters in length that will be sent one by one through the Telegram Bot.

## Credits

<h2 align="center"> Aleff :octocat: </h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://github.com/aleff-github">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/github.png?raw=true width="48" height="48" />
      </a>
      <br>Github
    </td>
    <td align="center" width="96">
      <a href="https://www.linkedin.com/in/alessandro-greco-aka-aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/linkedin.png?raw=true width="48" height="48" />
      </a>
      <br>Linkedin
    </td>
  </tr>
</table>
</div>