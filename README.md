tacacs--setup
=============

TACACS+ Server basic setup script for centralizing users for network devices management.
It contains:
TACACS+ Setup.sh which is the server installation script
tac_plus which is a script to allow the tacacs+ service to be started or stopped.
tac_plus.conf is a sample configuration file. 
Before running the script make sure to be logged in as root, tac_plus and tac_plus.conf should be placed in the /tmp/ directory.
This file contains acl access for a single router/switch (more may be added) prompt message configure for the host.
Make sure to change the ip addresses according to your enviroment.
two groups admins and monitoring. Admins possesses all privileges to configure the network device.
Monitoring is only allowed to run show commands.
There's two test users,edit the parameters if desired. 
testuser1 belongs to the admin group,has a des encrypted password: password and a des encrypted enable password:ciscoswitch
testuser2 belong to the monitoring group,has a des encrypted password:password2 and a des encrypted enable password:ciscomonitor
if you change the test users password make sure to run tac_pwd to get the encryption to put inside the configuration files

