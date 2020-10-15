ALF_HOME="/opt/alfresco"
DBNAME="alfresco"
DBUSER="USUARIO"

TARGET_FOLDER="/opt/alfresco/alf_data"
CURRENT_FOLDER="$(pwd)"
TIMESTAMP="dia-$(date +%u)"

DB_DUMP=${TIMESTAMP}_alfresco_postgres.tar
cd $TARGET_FOLDER
export PGPASSWORD="SENHA"

$ALF_HOME/postgresql/bin/pg_dump -U $DBUSER $DBNAME > $TARGET_FOLDER/$DB_DUMP
if [ $? -ne 0 ];
then
    echo "Error dumping POSTGRES Database: alfresco"
    exit 1
fi
