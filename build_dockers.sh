AWS_ACCOUNT_ID=672505479933
cd app
docker build -t $AWS_ACCOUNT_ID.dkr.ecr.us-west-1.amazonaws.com/django-app:latest .
docker push $AWS_ACCOUNT_ID.dkr.ecr.us-west-1.amazonaws.com/django-app:latest
cd ..

cd nginx
docker build -t $AWS_ACCOUNT_ID.dkr.ecr.us-west-1.amazonaws.com/nginx:latest .
docker push $AWS_ACCOUNT_ID.dkr.ecr.us-west-1.amazonaws.com/nginx:latest
cd ..
