��          �               �     �     �     	       ?        Y  ;   r  8   �     �  
   �     �  :        R     b  R   n      �     �  p   �  )   Y  :   �  �   �  z   Q  U   �  U   "  E   x  Z   �  L     �  f     /	     >	     [	     b	  ?   k	     �	  ;   �	  8    
     9
  
   F
     Q
  :   i
     �
     �
  R   �
           4  p   :  )   �  I   �  �     z   �  U   -  U   �  E   �  Z     L   z   Create fixture Default admin user/password: Django Fixtures Fixtures are example records that are inserted into a database. Fixtures may cause pain. For a model set :code:`default_permissions` to empty tuple: Go to or create `src/<app>/fixtures/<any_filename>.json` Load fixture Migrations Model (objects) history Need this for article history or any other object history. ORM tree models Permissions Rules will search for rules.py in each app when added autodiscover in settings.py: Run :code:`make shell` and then: Shell Some fixtures are loaded automatically when you start :code:`db` container. (See :code:`docker/db_init.sh` file) Then run :code:`manage.py shell` and run: To enter Django shell (:code:`shell_plus` actually) enter: Using permissions in a database is kinda slow. Django default permission system is kinda shit (uses database, doesn't have row-level permissions). When converting a model to a tree (while making a migration) set :code:`level`, :code:`lft` and :code:`rght` to :code:`0`. `django-reversion <https://django-reversion.readthedocs.io/en/stable/commands.html>`_ `factory_boy <https://github.com/FactoryBoy/factory_boy>`_ is a fixtures replacement. django-guardian uses DB. django-rules uses functions (all in memory). django-mptt or `django-treebeard <https://github.com/django-treebeard/django-treebeard>`_? django-treebeard can do more but django-mptt has a nicer API and better docs Project-Id-Version: pashinin.com 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-12-19 02:13+0300
PO-Revision-Date: 2017-12-12 10:27+0300
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ru
Language-Team: ru <LL@li.org>
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 Create fixture Default admin user/password: Django Fixtures Fixtures are example records that are inserted into a database. Fixtures may cause pain. For a model set :code:`default_permissions` to empty tuple: Go to or create `src/<app>/fixtures/<any_filename>.json` Load fixture Migrations Model (objects) history Need this for article history or any other object history. ORM tree models Permissions Rules will search for rules.py in each app when added autodiscover in settings.py: Run :code:`make shell` and then: Shell Some fixtures are loaded automatically when you start :code:`db` container. (See :code:`docker/db_init.sh` file) Then run :code:`manage.py shell` and run: Зайти в Django shell (:code:`shell_plus` на самом деле): Using permissions in a database is kinda slow. Django default permission system is kinda shit (uses database, doesn't have row-level permissions). When converting a model to a tree (while making a migration) set :code:`level`, :code:`lft` and :code:`rght` to :code:`0`. `django-reversion <https://django-reversion.readthedocs.io/en/stable/commands.html>`_ `factory_boy <https://github.com/FactoryBoy/factory_boy>`_ is a fixtures replacement. django-guardian uses DB. django-rules uses functions (all in memory). django-mptt or `django-treebeard <https://github.com/django-treebeard/django-treebeard>`_? django-treebeard can do more but django-mptt has a nicer API and better docs 