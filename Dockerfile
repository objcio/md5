FROM swift:5.0.1
RUN apt-get update
RUN apt-get install -y openssl libssl-dev
WORKDIR /app
COPY Package.swift ./
COPY Sources ./Sources
COPY Tests ./Tests
RUN swift test
CMD ["echo done"]
