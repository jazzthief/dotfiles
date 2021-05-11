#!/bin/bash

# Create a google cloud storage bucket and download a kaggle 
# dataset there from your cloud shell.
# gsutil and gcsfuse are assumed to be installed by default

# Display help message
usage() {
    echo "usage: $0 [REGION_ID] [BUCKET_NAME] [COMPETITION_NAME]"
    exit 2
}

if [[ $# -lt 3 ]] ; then
    usage
    exit 2
fi

REGION_ID=$1
BUCKET_NAME=$2
COMP_NAME=$3

# Create the bucket
gsutil mb -b on -l $REGION_ID gs://$BUCKET_NAME

# Mount the bucket to a mount point on the shell
# (read/write access to mount directory is required)
mkdir ~/$BUCKET_NAME
gcsfuse $BUCKET_NAME ~/$BUCKET_NAME

# Install kaggle's  python module 
pip3 install --user kaggle
# Make sure your API token is ~/.kaggle/kaggle.json

# Download the dataset
kaggle competitions download -c $COMP_NAME -p ~/$BUCKET_NAME

# Now the data is going to show up both in storage and in 
# the cloud shell mount directory. You can do stuff with it
# leveraging bash capabilities, e.g.:
#   -   Unzip files to a directory
#       unzip ~/$BUCKET_NAME/data.zip ~/$BUCKET_NAME/data_unzipped/
#   -   Print first N lines of a .csv file
#       head -n N ~/$BUCKET_NAME/file.csv
# etc.