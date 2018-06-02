Nomad
=====

This means that this server will manage state and make scheduling
decisions but will not run any tasks. Now we need some agents to run
tasks!

server is responsible for scheduling

client is responsible for running workloads

No configuration loaded from /etc/nomad
Must specify either server, client

server, client


.. code-block:: bash

   nomad server members
   # nomad server force-leave desktop.europe
   nomad node status
   nomad node status -self
   nomad node status -self -stats | less

   nomad plan jobs/certs.nomad  # preview what will happen
   nomad run jobs/certs.hcl     # run actually
   nomad job status certs       # see details
   nomad job stop certs         # stop <job>
   nomad run -force jobs/certs.nomad     # run periodic job immediately

   # view logs
   nomad status certs  # see allocs there
   nomad alloc logs 82a0cb48   # get STDOUT
   nomad alloc logs -stderr 82a0cb48   # get STDERR



Nomad-Vault integration
-----------------------

Taken from `here
<https://www.nomadproject.io/docs/vault-integration/index.html>`_. Token
(for a current task) creation is delegated to a trusted service such as
Nomad. So Nomad servers must be provided a Vault token (that can create
tokens).

1. Create a "nomad-server" policy to create and manage tokens:


.. code-block:: bash

   # Download the policy
   curl https://nomadproject.io/data/vault/nomad-server-policy.hcl -O -s -L

   # Write the policy to Vault
   vault policy write nomad-server nomad-server-policy.hcl
   Success! Uploaded policy: nomad-server

2. Create a Vault token role

.. code-block:: bash

   # Download the token role
   curl https://nomadproject.io/data/vault/nomad-cluster-role.json -O -s -L

   # Create the token role with Vault
   vault write /auth/token/roles/nomad-cluster @nomad-cluster-role.json
   Success! Data written to: auth/token/roles/nomad-cluster

3. Configure Nomad to use the created token role

.. code-block:: bash

   vault token create -policy nomad-server -period 72h -orphan
   ...
   token          xxxxxx-xxxxxxx-xxxxxx-xxxx-xxxxxx
   ...

Users should set the VAULT_TOKEN environment variable when starting the
agent instead.

So store this token in /etc/systemd/system/nomad.service.d/env.conf
which is read-only by root. Manually edit this file and write your token
there. For 3 Nomad servers.
