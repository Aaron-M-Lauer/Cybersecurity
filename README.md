## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below
  https://github.com/Aaron-M-Lauer/Cybersecurity/blob/main/diagrams/ELK_Diagram.jpg

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the
 entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain
 pieces of it, such as Filebeat.

  - playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- _Load balancers protect the system from DDoS attacks. Jump boxes are useful by giving access to the user from a
    single location, which can be secured and monitored

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- _Filebeat monitors the log files or locations that you specify, collects log events,
    and forwards them either to Elasticsearch or Logstash for indexing
- _Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify,
    such as Elasticsearch or Logstash

The configuration details of each machine may be found below.

| Name     | Function                    | IP Address | Operating System |
|----------|-----------------------------|------------|------------------|
| Jump Box | Gateway and docker/ansible  | 10.0.0.1   | Linux            |
| Web-1    | web server for DVWA         | 10.0.0.5   | linux            |
| Web-2    | web server for DVWA         | 10.0.0.6   | Linux            |
| Web-3    | web server for DVWA         | 10.0.0.7   | Linux            |
| ELK      | run ELK container/ Kibana   | 10.1.0.4   | linux            |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump-box-provisioner machine can accept connections from the Internet. Access to this machine is only allowed from
  the following IP addresses: xx.xxx.xxx.xxx (my public IP)

Machines within the network can only be accessed by Jump-Box_provisioner VM
- _The machine that would allow access to my ELK VM would be my Jump-Box-Provisioner VM
   And the IP address of the Jump-Box is_52.250.14.251

A summary of the access policies in place can be found in the table below.

| Name         | Publicly Accessible | Allowed IP Addresses |
|--------------|---------------------|----------------------|
| Jump Box     | Yes                 | xx.xxx.xxx.xxx       |
| Web-1        | No                  | 10.0.0.4             |
| Web-2        | No                  | 10.0.0.4             |
| Web-3        | No                  | 10.0.0.4             |
| ELK          | Yes (5601)          | xx.xxx.xxx.xxx       |
| Load Balancer| Yes (80)            | xx.xxx.xxx.xxx       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is 
  advantageous because it prevented us from having to configure ELK manualy everytime we started the ELK VM.
-The main advantage of automating ansible was to streamline the process and allowing us more 
    control over what was being installed on the ELK VM.

The playbook implements the following tasks:
- .first: the ELK playbook installs docker.io to the ELK VM
  .Second: Python is installed onto the ELK VM as well
  .third: because ELK requires more memory to run properly, the memory is increased to 262144
  .fourth: downloads, installs, and runs the docker ELK container on the ELK VM on restart so that you don't have to 
    manualy install it every time you start the ELK VM.
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/Aaron-M-Lauer/Cybersecurity/blob/main/diagrams/ELK_Setup.jpg

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _web1:10.0.0.5, web2:10.0.0.6, and web3:10.0.0.7

We have installed the following Beats on these machines:Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- _Filebeat is there to collect the log information about the file system and then it specifies which ones have been changed
    and whenever they get changed to elasticsearch or logstash. to see this you'd log into kibana and check th efilebeat logs
    for any changes made within the set parameters.
  _Metricbeat on the other hand shows stats for every running process on your machine. To see this you'd log into kibana and
    select metricbeat then select the specific system that you'd like to observe.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to etc/ansible/files/filebeat-config.yml.
- Update the filebeat-config.yml file to include host "10.1.0.4:9200" with username "elastic" and password
  "changeme" and setup.Kibana host to "10.1.0.4:5601"
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.
 https://github.com/Aaron-M-Lauer/Cybersecurity/blob/main/diagrams/Aaron_Filebeat.JPG


- _The Playbook file is filebeat-playbook.yml
  _I coppied it to  /etc/ansible/roles/filebeat-playbook.yml
- _ To make Ansible run the playbook on a specific machine, I'd update the filebeat-config.yml
  _To specify which machine to install the ELK server on versus which to install Filebeat on I'd add in the playbook 
    the IP's for our 3 web servers under the "hosts" section of the playbook (10.0.0.5/7) and then to include the ELK server 
    we also included the ELK IP (10.1.0.4)
  https://github.com/Aaron-M-Lauer/Cybersecurity/blob/main/ansible

- _The URL That I'd navigate to in order to check that the ELK server is running is http://52.250.14.251:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

  - ssh azdmin@52.188.67.141
  - docker run -ti container/ansible
  - cd /etc/ansible
  
