# # select parent maven image for maven build
FROM maven:3.6.3-jdk-8-slim AS MAVEN_BUILD

# # copy the source tree and pom.xml to our container
COPY ./rest/ .

# # package application code
RUN mvn clean package
FROM openjdk:8-jdk-buster
# When building, pass environment specific to load properties file as per ENV=sbx or stg or prd
ARG ENV
ENV ENV=${ENV}

# copy the environment specific properties file to the container to be utilized
COPY ./rest/application-${ENV}.properties /

# expose port 8088 for the container to run
EXPOSE 8080
# copy only the artifacts from first stage and discard the rest
COPY --from=MAVEN_BUILD ./target/*.jar /rest-service.jar

CMD /usr/local/openjdk-8/bin/java -jar /rest-service.jar
