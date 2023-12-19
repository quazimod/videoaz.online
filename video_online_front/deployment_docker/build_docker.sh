cd ..
$(aws ecr get-login --no-include-email --region eu-central-1 --registry-ids 503148106670) &&
docker build -t mm_portal_web . &&
docker tag mm_portal_web:latest 503148106670.dkr.ecr.eu-central-1.amazonaws.com/mm_portal_web:latest &&
docker push 503148106670.dkr.ecr.eu-central-1.amazonaws.com/mm_portal_web:latest
cd deployment_docker
