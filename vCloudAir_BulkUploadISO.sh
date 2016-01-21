#!/bin/bash
#vCloudAir_BulkUploadISO.sh
#Written by Matthew Schneider - http://blog.mdschneider.me
#---------------------------------------------------------
#All the variable you need are here:
OVFToolPath='/Applications/VMwareOVFTool/ovftool'
vCloudAirURL='us-california-1-3.vchs.vmware.com'
vCloudAirOrg='c9bef35a-dbc8-446e-a1d6-e8cd575a04c4'
vCloudAirVDC='CA-VDC01'
vCloudAirCatalog='default-catalog'
LocalUploadPath='/Users/md_schneider/projects/vCloudAir_BulkUploadISO/'
#---------------------------------------------------------
echo "vCloudAir_BulkUploadISO.sh"
echo "Written by Matthew Schneider - http://blog.mdschneider.me"
echo "Did you update the variables? If not you're going to try uploading to someone else's account"
#---------------------------------------------------------
echo vCloudAir_BulkUploadISO
echo Please enter your vCloud Air account:
read vCloudAirAccount
echo Please enter your password:
read vCloudAirPassword
FILETYPE='*.iso'

#echo $LocalUploadPath


for LocalISOFullPath in $LocalUploadPath$FILETYPE
do
    vCloudAirISOName=$(basename $LocalISOFullPath)
echo $vCloudAirISOName 

    echo Attempting to upload $vCloudAirISOName   
    "${OVFToolPath}" --X:logFile=vcd-upload.log --X:logLevel=verbose "${LocalISOFullPath}" "vcloud://${vCloudAirAccount}:${vCloudAirPassword}@${vCloudAirURL}?org=${vCloudAirOrg}&vdc=${vCloudAirVDC}&catalog=${vCloudAirCatalog}&media=${vCloudAirISOName}"
   
done

