FROM gradle:4.2.1-jdk8-alpine as builder
WORKDIR /fido2-rp-spring
COPY --chown=gradle:gradle /fido2-rp-spring /app
RUN gradle build --stacktrace

FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD /app/ssl_cert/fido2-springboot.p12 ./ssl_cert/fido2-springboot.p12
ARG JAR_FILE=/app/build/libs/fido2.0-server.jar
COPY --from=builder ${JAR_FILE} fido2.0-server-final.jar
ENTRYPOINT ["java","-jar","fido2.0-server-final.jar"]