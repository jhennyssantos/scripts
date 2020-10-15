1 - Maquinas Offline

O script lista todas as reservas DHCP, independente do escopo, e identifica quais maquinas estão offline. 
A partir de então, é localizar se as maquinas estão ou não ativas ainda.  


2 - Dump Diário PostgreSQL
- Nos campos DBUSER="USUARIO" e export PGPASSWORD="SENHA" informar o usuário e senha para acesso da base de dados;
- Para verificar o tamanho da base e posteriormente comparar com o tamanho do arquivo .tar gerado pelo script, faça o seguinte: 
-- cd /opt/alfresco/postgreSQL/bin
-- psql -U alfresco
-- SELECT datname, pg_size_pretty(pg_database_size(datname)) FROM pg_database;

- Depois retorno na pasta onde o dump foi gerado e execute: du -ha <nomedoarquivo>.tar


