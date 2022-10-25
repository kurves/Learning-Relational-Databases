<<<<<<< HEAD
=======
sudo cp ./.freeCodeCamp/.bashrc ..
touch ../.bash_history
sudo touch ../pg.log
sudo chmod 777 ../pg.log
sudo touch ../queryResults.log
sudo chmod 777 ../queryResults.log
sudo cp ./.freeCodeCamp/.psqlrc ..
sudo cp ./.freeCodeCamp/postgresql.conf /etc/postgresql/12/main/postgresql.conf
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
sudo cp ./.freeCodeCamp/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo chown -R postgres:postgres /var/lib/postgresql/12/main
sudo service postgresql stop
sudo service postgresql start
echo "SELECT 'CREATE USER freecodecamp WITH CREATEDB' WHERE NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname='freecodecamp')\gexec" | psql -U postgres -X
