#!/bin/bash

mkdir -p $1
cd $1

if [ -z $2 ]; then

  # get all projects
  oc get projects --no-headers | awk '{print $1}' > $1/allprojects.txt
  lines=`cat $1/allprojects.txt`

  for project in $lines ; do
    /backup/scripts/project_export.sh $project
  done
else
  /backup/scripts/project_export.sh $2
fi
