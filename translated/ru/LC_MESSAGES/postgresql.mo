��          �                         9     K  �   b  &   �  �     
   �     �  5     �   7  C   �  !   $  #   F  *   j  '   �  �  �     �     �     �  �   �  &   R  �   y  
   B     M  5   j  �   �  C   I	  !   �	  #   �	  *   �	  '   �	   And start containers again: Django migrations Docker container (dev) If this files exists :code:`make` will run migrations after containers were started (and then remove :code:`tmp/run-migrations` file). In this case just recreate a database: Migrations run after you first start a database container. Postgres container executes everything in :code:`docker/docker-entrypoint-initdb.d` which is only touching a file :code:`tmp/run-migrations`. PostgreSQL PostgreSQL high availability Postgres v10 is used currently in a docker container. There is no way to do this in :code:`docker-entrypoint-initdb.d/...` script because Postgres container does not have anything but Postgres, even :code:`python` command. To choose the best way for HA see `this table <postgres-ha-table>`_ To start db container separately: Upgrading to a new Postgres version When writing in :code:`docker-compose.yml` container will not start with an error: Project-Id-Version: pashinin.com 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-12-21 00:48+0300
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ru
Language-Team: ru <LL@li.org>
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 And start containers again: Django migrations Docker container (dev) If this files exists :code:`make` will run migrations after containers were started (and then remove :code:`tmp/run-migrations` file). In this case just recreate a database: Migrations run after you first start a database container. Postgres container executes everything in :code:`docker/docker-entrypoint-initdb.d` which is only touching a file :code:`tmp/run-migrations`. PostgreSQL PostgreSQL high availability Postgres v10 is used currently in a docker container. There is no way to do this in :code:`docker-entrypoint-initdb.d/...` script because Postgres container does not have anything but Postgres, even :code:`python` command. To choose the best way for HA see `this table <postgres-ha-table>`_ To start db container separately: Upgrading to a new Postgres version When writing in :code:`docker-compose.yml` container will not start with an error: 