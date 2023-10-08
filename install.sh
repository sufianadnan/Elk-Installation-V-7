#!/bin/bash
echo -e "\e[1;32mUpdating packages...\e[0m"
apt-get update -y 2>&1 >/dev/null
echo -e "\e[1;32mUpdate completed\e[0m"

echo -e "\e[1;32mUpgrading packages...This can take a few mins\e[0m"
apt-get upgrade -y 2>&1 >/dev/null
echo -e "\e[1;32mUpgrade completed\e[0m"

sudo apt-get install pv -y 2>&1 >/dev/null

# Install required packages for Elastic Stack
echo -e "\e[1;32mInstalling apt-transport-https, ca-certificates, and gnupg2...\e[0m"
apt-get install apt-transport-https ca-certificates gnupg2 -y 2>&1 | pv -p --timer --rate --bytes >/dev/null

# Add the Elastic Stack repository
echo -e "\e[1;32mAdding the Elasticsearch repository...\e[0m"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - 2>&1 | pv -p --timer --rate --bytes >/dev/null
sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
apt-get update -y 2>&1 | pv -p --timer --rate --bytes >/dev/null

# Install Elasticsearch
echo -e "\e[1;32mInstalling Elasticsearch...\e[0m"
apt-get install elasticsearch -y 2>&1 | pv -p --timer --rate --bytes >/dev/null
echo -e "\e[1;32mElasticsearch install completed\e[0m"

# Start Elasticsearch service
echo -e "\e[1;32mStarting Elasticsearch service...\e[0m"
systemctl start elasticsearch >/dev/null
systemctl enable elasticsearch >/dev/null

# Install 'curl' command line tool
echo -e "\e[1;32mInstalling curl...\e[0m"
sudo apt-get install curl >/dev/null 2>&1

# Install Kibana
echo -e "\e[1;32mInstalling Kibana...\e[0m"
sudo apt install kibana -y 2>&1 | pv -p --timer --rate --bytes >/dev/null
echo -e "\e[1;32mKibana install completed\e[0m"

# Start Kibana service
echo -e "\e[1;32mStarting Kibana service...\e[0m"
sudo systemctl enable kibana >/dev/null
sudo systemctl start kibana >/dev/null

# Install Logstash
echo -e "\e[1;32mInstalling Logstash\e[0m"
sudo apt-get install logstash -y 2>&1 | pv -p --timer --rate --bytes >/dev/null
echo -e "\e[1;32mLogstash install completed\e[0m"

# Start Logstash service
echo -e "\e[1;32mStarting Logstash\e[0m"
sudo systemctl enable logstash >/dev/null
sudo systemctl start logstash >/dev/null

echo -e "\e[1;32mChecking Elasticsearch status...\e[0m"
curl -X GET "localhost:9200"
echo -e "\e[1;32mAll Tasks Completed\e[0m"
