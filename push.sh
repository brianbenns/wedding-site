#!/usr/bin/env bash

docker build -t bbenns/wedding-website:latest .
docker push bbenns/wedding-website:latest
aws ecs register-task-definition --cli-input-json file://task-def.json
aws ecs update-service --cluster websites --service wedding-website --desired-count 0
sleep 25
aws ecs update-service --cluster websites --service wedding-website --task-definition wedding-website
aws ecs update-service --cluster websites --service wedding-website --desired-count 1
