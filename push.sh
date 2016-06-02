#!/usr/bin/env bash
sudo docker build -t bbenns/wedding-website:latest .
sudo docker push bbenns/wedding-website:latest
aws ecs register-task-definition --cli-input-json file://task-def.json --profile personal
aws ecs update-service --cluster websites --service wedding-website --desired-count 0  --profile personal
sleep 35
aws ecs update-service --cluster websites --service wedding-website --task-definition wedding-website --profile personal
aws ecs update-service --cluster websites --service wedding-website --desired-count 1 --profile personal
