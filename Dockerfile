FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD /ssl_cert/fido2-springboot.p12 ./ssl_cert/fido2-springboot.p12
ARG JAR_FILE=/build/libs/fido2.0-server.jar
COPY ${JAR_FILE} fido2.0-server-final.jar
ENTRYPOINT ["java","-jar","fido2.0-server-final.jar"]