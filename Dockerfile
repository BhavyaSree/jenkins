FROM ubuntu

RUN apt update -y && \
    apt-get install -y openjdk-8-jre && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
# ARG JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
ENV PATH="$JAVA_HOME/bin:$PATH"

WORKDIR /app

COPY . /app

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/app/jenkins.war" ]