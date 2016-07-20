#!/bin/bash
sudo sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
echo "[provisioner] installing java..."
echo -ne '\n' | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -qq update
sudo apt-get --assume-yes -qq install oracle-java8-installer
sudo apt-get --assume-yes -f -qq install oracle-java8-set-default
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get --assume-yes -f autoremove

wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add - 
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
sudo apt-get -qq update
sudo apt-get --assume-yes -qq install neo4j
echo "[provisioner] stopping neo4j..."
neo4j stop

echo "NEO4J_ULIMIT_NOFILE=50000" >> neo4j
sudo cp neo4j /etc/default/
sudo chown neo4j /etc/default/neo4j

echo "[provisioner] updating config..."
sed -i 's/#dbms\.connector\.http\.address=0\.0\.0\.0/dbms.connector.http.address=0.0.0.0/' /etc/neo4j/neo4j.conf
sed -i 's/#dbms\.connector\.bolt\.address=0\.0\.0\.0/dbms.connector.bolt.address=0.0.0.0/' /etc/neo4j/neo4j.conf
echo "[provisioner] bolt and http endpoints opened!"
echo "[provisioner] starting neo4j..."
sudo service neo4j start
