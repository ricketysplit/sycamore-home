build-lambda:
	aws cloudformation package --template-file infra/lambdas.yml --s3-bucket sycamore-app-artifact --output-template-file dist/infra/lambdas.yml

deploy-lambda:
	aws --region us-east-1 cloudformation deploy \
		--template-file dist/infra/lambdas.yml \
		--stack-name sycamore \
		--capabilities CAPABILITY_IAM

deploy-static:
	aws s3 sync ./dist s3://rickyharkins.com