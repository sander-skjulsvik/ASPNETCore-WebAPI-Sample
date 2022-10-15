# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/aspnet:6.0
COPY SampleWebApiAspNetCore/bin/Release/net6.0/linux-x64/publish/ App/
WORKDIR /App
ENTRYPOINT ["dotnet", "SampleWebApiAspNetCore.dll"]
