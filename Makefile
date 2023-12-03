include makefile.env

build-lambda:
	aws cloudformation package --template-file infra/lambdas.yml --s3-bucket $(S3_APP_BUCKET) --output-template-file dist/infra/lambdas.yml

deploy-lambda:
	aws --region us-east-1 cloudformation deploy \
		--template-file dist/infra/lambdas.yml \
		--stack-name sycamore \
		--capabilities CAPABILITY_IAM

build-static:
	cd app && ng build

deploy-static:
	aws s3 sync ./app/dist/$(APP_NAME)/browser s3://$(S3_STATIC_SITE_URL)