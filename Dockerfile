FROM gradle:4.2.1-jdk8-alpine as builder
COPY --chown=gradle:gradle . /build
WORKDIR /build
RUN gradle build --stacktrace

FROM ubuntu:latest
FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY --from=builder /build/libs/fido2.0-server.jar fido2.0-server-final.jar
ENTRYPOINT ["java","-jar","fido2.0-server-final.jar"]