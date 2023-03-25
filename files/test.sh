#!/bin/bash

count=1
while ((count <= 5)); do
  echo "Count ${count}" >> /files/b.txt
  sleep 1
  ((count++))
done
echo "Done"