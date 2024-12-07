# Uygulamanın çaliması için JDK lazım.
FROM openjdk:17

# Projemizin Jar dosyasının konumu
ARG JAR_FILE=target/*.jar

#  Projenin Jar halini Docker'ın içine şu isimle kopayalaa
COPY ${JAR_FILE} my-application

# iç portu sabitlemek içinn
EXPOSE 8090

# Uygulamanın çalışacağı komut
ENTRYPOINT ["java","-jar","/my-application"]

# docker build -t hsaglam/dockerfileexmple-1.0.0 .
# docker build  --build-arg JAR_FILE=target/dockerfileexmple-1.0.0.jar   --tag    hsaglam/dockerfileexmple .