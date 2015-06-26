#!/bin/bash
##
if [ $# -lt 3 ]
then
    echo "Usage: runEMHybridSetup.sh <DBCS IP> <JCS IP> <OTD IP>"
    exit 1
fi
DB_IP=$1
JCS_IP=$2
OTD_IP=$3
#
echo "************************************************"
echo "* Setup ssh for oracle user on JCS VM ...."
echo "************************************************"
scp -o "StrictHostKeyChecking no" -i ../labkey ../labkey.pub opc@${JCS_IP}:/home/opc/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/oracleSudo.txt opc@${JCS_IP}:/home/opc/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/setupJCS.sh opc@${JCS_IP}:/home/opc/.
ssh -t -o "StrictHostKeyChecking no" -i ../labkey opc@${JCS_IP} "sudo -i /home/opc/setupJCS.sh"
#
echo "************************************************"
echo "* Setup ssh for oracle user on OTD VM ...."
echo "************************************************"
scp -o "StrictHostKeyChecking no" -i ../labkey ../labkey.pub opc@${OTD_IP}:/home/opc/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/oracleSudo.txt opc@${OTD_IP}:/home/opc/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/setupOTD.sh opc@${OTD_IP}:/home/opc/.
ssh -t -o "StrictHostKeyChecking no" -i ../labkey opc@${OTD_IP} "sudo -i /home/opc/setupOTD.sh"
#
echo "************************************************"
echo "* Setup DBCS VM ...."
echo "************************************************"
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/setupDBCS1.sh oracle@${DB_IP}:~/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/setupDBCS2.sh opc@${DB_IP}:/home/opc/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/oracleSudo.txt opc@${DB_IP}:/home/opc/.
scp -o "StrictHostKeyChecking no" -i ../labkey ../EMHybrid/unlockDBSNMP.sql oracle@${DB_IP}:~/.
ssh -t -o "StrictHostKeyChecking no" -i ../labkey oracle@${DB_IP} "~/setupDBCS1.sh"
ssh -t -o "StrictHostKeyChecking no" -i ../labkey opc@${DB_IP} "sudo -i /home/opc/setupDBCS2.sh"
#
echo "**********************************************"
echo "* EM Hybrid setup is Complete ...."
echo "**********************************************"