FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copy csproj and restore as distinct layers
COPY src/*.csproj ./

# Restore as distinct layers
RUN dotnet restore

# Copy everything
COPY src .

# Build and publish a release
RUN dotnet publish /src -c Release -o /out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /
COPY --from=build /out .

EXPOSE 80
ENTRYPOINT ["dotnet", "dotnet.dll"]

