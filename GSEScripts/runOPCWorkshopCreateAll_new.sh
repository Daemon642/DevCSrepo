# !/bin/sh
#
if [ $# -lt 1 ]
then
        echo "Usage: runOPCWorkshopCreateAll.sh <password>" 
        exit 1
fi
#
PASSWORD=$1
#
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle21884 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle03294 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle45722 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle48514 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle88327 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle54892 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle16340 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle99246 SetupJCSWorkshopAccount
./runManageOPC.sh gse_support-admin@oracleads.com ${PASSWORD} usoracle32870 SetupJCSWorkshopAccount