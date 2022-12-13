# https://learn.microsoft.com/tr-tr/aspnet/core/host-and-deploy/docker/building-net-docker-images
# some of the commands are adjusted for a better fit
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY . ./
WORKDIR /source
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
# also alpine and runtime dotnet images could be an option. haven't had a chance to try them out.
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "sample-app.dll"]