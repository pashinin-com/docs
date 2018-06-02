SSL/TLS certificates
====================

Of course LetsEncrypt certs are used. They are updated with `acme.sh
<https://github.com/Neilpang/acme.sh>`_ using DNS challenge (adding TXT
record, checking, then removing it). So DNS server was set up for dynamic
changes of a zone.

Install acme.sh (as root)
-------------------------

.. code-block:: bash

   curl https://get.acme.sh | sh
   # Installed to /root/.acme.sh/acme.sh
   # Installing alias to '/root/.bashrc'

It will install a cron job for a user, **but** you will not find it in
/etc/cron... files! You can see user's cron jobs by "crontab -l". To
edit them: "crontab -e".

DNS config
----------

todo: nsupdate

DNS is also configured to resolve "consul" domains. So that "dig
vault.service.consul" returns an IP of unsealed Vault server.


Get certs (without deploy hook)
-------------------------------

My DNS server is the same machine which runs acme.sh, and DNS server
allows "local" changes. So I don't need to specify a key to update DNS
records. Though DNS server is configured for remote updates using a key.

.. code-block:: bash

   # Set this variables only if your DNS server is not the same machine
   # export NSUPDATE_SERVER="10.254.239.4"
   # export NSUPDATE_KEY="/etc/bind/keys/update.key"
   acme.sh --staging --issue -d pashinin.com  -d '*.pashinin.com' --dns dns_nsupdate --dnssleep 2
   # ...
   # Your cert is in  /root/.acme.sh/<domain>/<domain>.cer
   # Your cert key is in  /root/.acme.sh/<domain>/<domain>.key
   # The intermediate CA cert is in  /root/.acme.sh/<domain>/ca.cer
   # And the full chain certs is there:  /root/.acme.sh/<domain>/fullchain.cer


These NS variables are written to account.conf. So acme.sh remembers them.


Distribute certs
----------------

I use Vault to securely store certs and other sensitive data. Vault uses
Consul as a key-value storage. acme.sh need these environment variables
for vault_cli.sh:

.. code-block:: text

   VAULT_PREFIX - this contains the prefix path in vault ("acme")
   VAULT_ADDR - to find your vault server ("http://127.0.0.1:8200"), not https

So I added them to .acme.sh/account.conf file:


.. code-block:: text

   VAULT_PREFIX="acme"
   VAULT_ADDR="http://127.0.0.1:8200"


The full command I'm running is:

.. code-block:: bash

   acme.sh --staging --issue -d pashinin.com  -d '*.pashinin.com' --dns dns_nsupdate --dnssleep 2 --deploy --deploy-hook vault_cli

acme.sh remembers arguments so when a cron job is running it will deploy
as I specified. It remembers them in <domain>/<domain>.conf.


Vault
-----

"acme" policy (write only)
^^^^^^^^^^^^^^^^^^^^^^^^^^

First I created a policy to only write to "acme" path. That's the only
thing acme.sh should do. So I created "p.hcl" file and wrote it as
"acme" policy:

.. code-block:: text

   path "acme/*" {
     capabilities = ["create", "update", "read"]
   }

.. code-block:: bash

   vault policy write acme p.hcl
   vault policy list       # to see "acme" was created
   vault policy read acme


But then I need a token to actually write or I'll get an error:

.. code-block:: text

   Error writing data to acme/pashinin.com/cert.pem: Error making API request.

   URL: PUT http://vault.service.consul:8200/v1/acme/pashinin.com/cert.pem
   Code: 400. Errors:

   * missing client token

"acme" role
^^^^^^^^^^^

.. code-block:: bash

   vault write auth/approle/role/acme policies="acme"
   vault write auth/approle/role/acme policies="acme" token_ttl="1m" secret_id_ttl="1m"
   vault read auth/approle/role/acme
   vault read auth/approle/role/acme/role-id
   Key        Value
   ---        -----
   role_id    xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

Then I just add ROLE_ID to account.conf:

.. code-block:: text

   ROLE_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

Generate secret_id (by human or provision software, Nomad?):

.. code-block:: bash

   vault write -field=secret_id -f auth/approle/role/acme/secret-id

   # List Secret ID Accessors (useful to revoke tokens):
   vault list auth/approle/role/acme/secret-id
   # <id1>
   # <id2>
   # <id3>

Then create a token:

.. code-block:: bash

   vault token create -policy=acme -display-name="For acme.sh"
   # -period=3d


.. code-block:: text

   --pre-hook


no handler for route (Vault error)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   vault auth list
   vault secrets list
   vault secrets enable -path=acme generic
   vault secrets disable =acme
   vault secrets enable -path=acme kv

   Solution:

.. code-block:: bash

   vault auth enable approle
