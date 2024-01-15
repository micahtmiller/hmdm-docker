gcloud compute instances create hmdm-ubuntu \
    --project=sca-hmdm \
    --zone=us-central1-a \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,subnet=default \
    --provisioning-model=STANDARD \
    --service-account=headwindmdm@sca-hmdm.iam.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20221201,mode=rw,size=20,type=projects/sca-hmdm/zones/us-central1-a/diskTypes/pd-balanced
#     --image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20221202,mode=rw,size=10,type=projects/sca-hmdm/zones/us-central1-a/diskTypes/pd-balanced
# Redirect port 80 to 8080
# docker run --rm -d -p 8080:8080 -p 31000:31000 -e SQL_HOST=10.20.32.3 -e SQL_BASE=hmdm -e SQL_USER=hmdm -e SQL_PASS=topsecret -e BASE_DOMAIN=build.h-mdm.com -e PROTOCOL=http -v /tmp/tomcat/work:/usr/local/tomcat/work --name="hmdm" headwindmdm/hmdm:0.1.0
# docker run --rm -d -p 443:8443 -p 31000:31000 -e SQL_HOST=10.20.32.3 -e SQL_BASE=hmdm -e SQL_USER=hmdm -e SQL_PASS=topsecret -e BASE_DOMAIN=hmdm.summitclassicalacademy.org -e FORCE_RECONFIGURE=true -v /etc/letsencrypt:/etc/letsencrypt -v $(pwd)/volumes/work:/usr/local/tomcat/work --name="hmdm" headwindmdm/hmdm:0.1.0
