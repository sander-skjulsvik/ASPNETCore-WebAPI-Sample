release-linux-x64:
	dotnet publish -c Release -r linux-x64 -p:PublishReadyToRun=true

docker-run-release:
	docker run -d -p 8000:80 --name aspo aspnetcore-sample

docker-clean:
	docker stop aspo
	docker rm aspo

docker-upload:
	...
