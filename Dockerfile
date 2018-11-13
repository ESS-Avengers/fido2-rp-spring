FROM gradle:4.2.1-jdk8-alpine as builder
COPY --chown=gradle:gradle .
WORKDIR .
RUN gradle build

FROM ubuntu:latest
FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY --from=builder /fido2-rp-spring/build/libs/fido2.0-server.jar /app/
ENTRYPOINT ["java","-jar","/app/fido2.0-server.jar"]