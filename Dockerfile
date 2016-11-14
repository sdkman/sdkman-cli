FROM java:8

RUN apt-get update && \
  apt-get -y install zip

# Copy all here
RUN mkdir -p /usr/src/app
ADD . /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["./gradlew"]
