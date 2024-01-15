gcloud sql instances create hmdm-psql12-3 \
    --database-version=POSTGRES_12 \
    --zone=us-central1-c \
    --cpu=2 \
    --memory=7680MB \
    --network=projects/sca-hmdm/global/networks/default \
    --no-assign-ip