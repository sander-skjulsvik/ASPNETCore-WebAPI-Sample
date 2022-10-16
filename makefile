release-linux-x64:
	dotnet publish -c Release -r linux-x64 -p:PublishReadyToRun=true

docker-run-release:
	docker run -p 8000:80  --name aspo aspnetcore-sample

docker-clean:
	docker stop aspo
	docker rm aspo

docker-build:
	docker build \
		-t sandersregistrytwo.azurecr.io/web-api/web-api \
		.

acr-upload-web-api:
	docker push sandersregistrytwo.azurecr.io/web-api/web-api

all-new: release-linux-x64 docker-build acr-upload-web-api

