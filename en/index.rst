pashinin.com
************

This is an open source web-site. You can build it together with
me. Write your ideas `here
<https://github.com/pashinin-com/pashinin.com/issues>`_.

+---------------------------------------+----------------------------------+
| Technologies used                     | Comment                          |
+=======================================+==================================+
| Ubuntu 16.04                          |                                  |
+---------------------------------------+----------------------------------+
| Python 3.6                            |                                  |
+---------------------------------------+----------------------------------+
| :doc:`PostgreSQL</postgresql>` 10     |                                  |
+---------------------------------------+----------------------------------+
| Nginx                                 |                                  |
+---------------------------------------+----------------------------------+
| Django, Javascript                    | languages and frameworks         |
+---------------------------------------+----------------------------------+
| Celery                                | For long running tasks           |
+---------------------------------------+----------------------------------+
| Postfix, Dovecot                      | :doc:`Mail server</mailserver>`  |
+---------------------------------------+----------------------------------+
| `Docker`_                             | containers (for development)     |
+---------------------------------------+----------------------------------+
| Git                                   | for development                  |
+---------------------------------------+----------------------------------+


How to start?
*************

#. Register at Github_ and fork `this repository <https://github.com/pashinin-com/pashinin.com>`_.
#. Then see :doc:`How to start </how_to_start>`

..
   :doc:`Linux </how_to_start_linux>` (better),
   :doc:`Windows </how_to_start_win>`,
   :doc:`Mac </how_to_start_mac>`


.. toctree::
   :maxdepth: 2
   :caption: Contents:

   how_to_start
   frontend
   backend
   deploy
   docs
   javascript
   api
   long-running-tasks
   testing
   mailserver
   auth
   cache
   maildb-sql
   telegram
   update
   parser
   django
   ssl
   nomad
   dns
   network


.. _core/tasks.py: https://github.com/pashinin-com/pashinin.com/blob/master/src/core/tasks.py
.. _travis.yml: https://github.com/pashinin-com/pashinin.com/blob/master/.travis.yml#L105-L106
.. _Docker: https://www.docker.com/
.. _Linux: https://www.ubuntu.com/
.. _Github: https://github.com
