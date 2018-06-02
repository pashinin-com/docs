DNS
===

Bind 9 is running on a balancer.

DNSSEC
------


Dynamic updates
---------------

.. code-block:: bash

   nsupdate -k ~/update.key  # don't need a key when running locally
   >
   server 10.254.239.4
   zone pashinin.com
   update add docs.pashinin.com 3600 A 89.179.240.127
   show
   send

   server ns1.domain.local
   zone 5.168.192.in-addr.arpa
   update add 24.5.168.192.in-addr.arpa 1200 PTR user04.domain.local
   update delete 91.5.168.192.in-addr.arpa
   show
   send



http://kiko.ghost.io/things-i-wish-id-known-about-nsupdate-and-dynamic-dns-updates/
