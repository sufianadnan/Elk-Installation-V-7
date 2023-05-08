# Elk-Installation-V-7
`ElasticSearch`
`Logstash`
`Kibana`

This script installs the latest version of the ELK (Elasticsearch, Logstash, and Kibana) stack, version 7.
It first updates and upgrades the system's packages, installs necessary dependencies like apt-transport-https, ca-certificates, and gnupg2.
Then adds the Elasticsearch repository, and installs Elasticsearch, Kibana, and Logstash. 
Finally, it starts the Elasticsearch, Kibana, and Logstash services and checks the Elasticsearch status.
No Config/YML files are edited and are running the default version.
JAVA INSTALL IS NOT REQUIRED
HOW TO USE:
1. Open a terminal on your Linux system.
2. Clone or download the script from the Github repository.
3. Navigate to the directory where the script is saved.
4. Make the script executable by running the command `chmod +x install.sh`
5. Run the script as sudo by running the command `sudo ./install.sh`
6. Wait for the script to complete the installation of Elasticsearch, Kibana, and Logstash.
7. Once the script is complete, you should be able to access Elasticsearch at http://localhost:9200 and Kibana at http://localhost:5601 in your web browser.
