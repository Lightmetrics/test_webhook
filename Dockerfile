<<<<<<< Updated upstream
# Use a Maven image for building the project
FROM maven:3.8-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:resolve

# Copy the rest of the project files
COPY . .

# Package the Karate project
RUN mvn clean package -DskipTests

# Use a lightweight JRE image for running the tests
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the compiled JAR from the build stage
COPY --from=build /app/target/*.jar karate.jar

# Set the entry point to run Karate tests
ENTRYPOINT ["java", "-jar", "karate.jar"]
ENTRYPOINT ["java", "-jar", "karate.jar", "-Dkarate.env=qa"]
=======
#FROM python:3.11-slim
FROM python:3.11-alpine

# Install tools
RUN apk add --no-cache curl unzip

# Install Terraform
ENV TERRAFORM_VERSION=1.8.5
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/terraform \
    && rm terraform.zip


WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
>>>>>>> Stashed changes
