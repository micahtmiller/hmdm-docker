# docker run -d -v ~/.config/cloudsql:/cloudsql \
#   --network=host \
#   -v ~/.config/gcloud/application_default_credentials.json:/config \
#   gcr.io/cloudsql-docker/gce-proxy:1.33.1 /cloud_sql_proxy \
#   -dir=/cloudsql \
#   -instances=sca-hmdm:us-central1:hmdm-psql12-3 \
#   -credential_file=/config

docker run -d \
    -p 127.0.0.1:5432:5432 \
    -v ~/.config/gcloud/application_default_credentials.json:/config \
    gcr.io/cloudsql-docker/gce-proxy:1.33.1 /cloud_sql_proxy \
    -instances=sca-hmdm:us-central1:hmdm-psql12-3=tcp:0.0.0.0:5432 \
    -credential_file=/config
