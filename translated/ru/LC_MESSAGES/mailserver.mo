��          �               �     �  ]   �     )     <  �   A     �     �  '   �  n     "   �  i   �       I   !  F   k     �  3   �     �            E     V   W     �     �  .   �       �       �  ]   �     S     f  �   k     �     	  '   	  n   C	  "   �	  i   �	     ?
  I   K
  F   �
     �
  3   �
          1     5  E   ;  V   �     �     �  .        5   Add a mailbox Commonly used available substitutions (see http://wiki2.dovecot.org/Variables for full list): Create sieve file: DKIM DKIM is not about encrypting messages. This is ensuring that message (which tells it is from example.org) indeed is from example.org. Dovecot lda.conf: Dovecot mailboxes.conf: Edit /etc/dovecot/conf.d/90-sieve.conf: Generate a password with MD5-CRYPT (why MD5-CRYPT? where did I see this shit? PostfixAdmin?). A command below. Just DELETE from a database table: MD5-CRYPT: A weak but common scheme often used in /etc/shadow. The encrypted password will start with $1$ Mail server Password schemes: http://wiki2.dovecot.org/Authentication/PasswordSchemes Probably add a subdomain (like mail.example.org). Bind zones are here: Remove mailbox Run SQL code to insert a new mailbox to a database. SQL configuration SSL Sieve Sieve is a language for filtering e-mail messages (antispam actions). So we need a key associated with a domain and a signaute of each email using this key. To generate password: Using Postfix, Dovecot. dovecot-sql.conf - in this file we say Dovecot http://sieve.info/ Project-Id-Version: pashinin.com 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-05-05 09:48+0300
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ru
Language-Team: ru <LL@li.org>
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.4.0
 Add a mailbox Commonly used available substitutions (see http://wiki2.dovecot.org/Variables for full list): Create sieve file: DKIM DKIM is not about encrypting messages. This is ensuring that message (which tells it is from example.org) indeed is from example.org. Dovecot lda.conf: Dovecot mailboxes.conf: Edit /etc/dovecot/conf.d/90-sieve.conf: Generate a password with MD5-CRYPT (why MD5-CRYPT? where did I see this shit? PostfixAdmin?). A command below. Just DELETE from a database table: MD5-CRYPT: A weak but common scheme often used in /etc/shadow. The encrypted password will start with $1$ Mail server Password schemes: http://wiki2.dovecot.org/Authentication/PasswordSchemes Probably add a subdomain (like mail.example.org). Bind zones are here: Remove mailbox Run SQL code to insert a new mailbox to a database. SQL configuration SSL Sieve Sieve is a language for filtering e-mail messages (antispam actions). So we need a key associated with a domain and a signaute of each email using this key. To generate password: Using Postfix, Dovecot. dovecot-sql.conf - in this file we say Dovecot http://sieve.info/ 