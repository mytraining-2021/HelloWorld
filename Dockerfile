# Use the official OpenJDK image from the Docker Hub
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file into the container at /app/app.jar
COPY target/*.jar helloworld.jar

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "helloworld.jar"]
