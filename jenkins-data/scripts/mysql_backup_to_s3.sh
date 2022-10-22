#!/bin/bash

DATE=$(date +%H-%M-%S-%d-%m-%y)
BACKUP_FILE_NAME=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP_FILE_NAME && \
export AWS_ACCESS_KEY_ID=S3_ACCESS_KEY_ID_PROVIDED_BY_AWS && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading db backup" && \
aws s3 cp /tmp/db-$DATE.sql s3:\\$BUCKET_NAME/$BACKUP_FILE_NAME
