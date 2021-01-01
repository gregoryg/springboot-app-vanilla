# # select parent maven image for maven build
# FROM maven:3.6.3-jdk-8-slim AS MAVEN_BUILD

# # copy the source tree and pom.xml to our container
# COPY . .

# # package application code
# RUN mvn clean package
FROM openjdk:8-jdk-alpine
## Copy the application .jar file to our container
COPY rest-service-0.0.1-SNAPSHOT.jar .
# When building, pass environment specific to load properties file as per ENV=sbx or stg or prd
ARG ENV
ENV ENV=${ENV}

# copy the environment specific properties file to the container to be utilized
COPY ./application-${ENV}.properties /

# expose port 8088 for the container to run
EXPOSE 8088
