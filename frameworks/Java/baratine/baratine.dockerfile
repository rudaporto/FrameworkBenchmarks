FROM maven:3.6.1-jdk-11-slim as maven
WORKDIR /baratine
COPY pom.xml pom.xml
COPY src src
RUN mvn package -q

FROM openjdk:11.0.3-jre-slim
WORKDIR /baratine
COPY --from=maven /baratine/target/testTechempowerBaratine-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar", "tfb-database"]
