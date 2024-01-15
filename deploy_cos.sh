gcloud compute instances create-with-container hmdm-docker \
    --project=sca-hmdm \
    --zone=us-central1-a \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,subnet=default \
    --service-account=headwindmdm@sca-hmdm.iam.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --image=projects/cos-cloud/global/images/cos-stable-101-17162-40-34,mode=rw \
    --boot-disk-type=pd-balanced \
    --boot-disk-device-name=hmdm-docker \
    --container-image=headwindmdm/hmdm:0.1.0 \
    --container-privileged \
    --container-stdin \
    --labels=container-vm=cos-stable-101-17162-40-34 \
    --container-env=SQL_HOST=10.20.32.5,SQL_BASE=hmdm,SQL_USER=hmdm,SQL_PASS=topsecret,ADMIN_EMAIL=micah@summitclassicalacademy.org,BASE_DOMAIN=dev.hmdm.summitclassicalacademy.org,HMDM_VARIANT=os,HMDM_URL=https://h-mdm.com/files/hmdm-5.06.3-os.war,CLIENT_VERSION=5.04,PROTOCOL=http,FORCE_RECONFIGURE=false

#     --image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20221202,mode=rw,size=10,type=projects/sca-hmdm/zones/us-central1-a/diskTypes/pd-balanced
# Redirect port 80 to 8080
# docker run --rm -d -p 8080:8080 -p 31000:31000 -e SQL_HOST=10.20.32.3 -e SQL_BASE=hmdm -e SQL_USER=hmdm -e SQL_PASS=topsecret -e BASE_DOMAIN=build.h-mdm.com -e PROTOCOL=http -v /tmp/tomcat/work:/usr/local/tomcat/work --name="hmdm" headwindmdm/hmdm:0.1.0
docker run --rm -d -p 443:8443 -p 31000:31000 -e SQL_HOST=10.20.32.3 -e SQL_BASE=hmdm -e SQL_USER=hmdm -e SQL_PASS=topsecret -e BASE_DOMAIN=hmdm.summitclassicalacademy.org -e FORCE_RECONFIGURE=true -v /etc/letsencrypt:/etc/letsencrypt -v $(pwd)/volumes/work:/usr/local/tomcat/work --name="hmdm" headwindmdm/hmdm:0.1.0
