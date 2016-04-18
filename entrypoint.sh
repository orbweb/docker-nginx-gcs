#!/bin/sh
set -e

for bucket in $GCS_BUCKETS
do
    mkdir -p /mnt/$bucket
    gcsfuse --stat-cache-ttl $CACHE_TTL --key-file /.gcloud.json $bucket /mnt/$bucket
    echo "Mounted ${bucket}"
done

exec "$@"
