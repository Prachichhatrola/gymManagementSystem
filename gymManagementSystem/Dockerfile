# Stage 1: Build
FROM maven:3.8-jdk-17 AS builder

WORKDIR /build

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn -B -DskipTests clean package

# Stage 2: Runtime
FROM tomcat:9.0-jdk17

# Set environment variables
ENV SPRING_DATASOURCE_URL=""
ENV SPRING_DATASOURCE_USERNAME=""
ENV SPRING_DATASOURCE_PASSWORD=""
ENV SERVER_PORT=8080
ENV SPRING_PROFILES_ACTIVE="prod"

# Remove default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy built WAR from builder stage
COPY --from=builder /build/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Configure Tomcat
RUN echo "JAVA_OPTS=\"-Dserver.port=${SERVER_PORT}\"" >> /usr/local/tomcat/bin/catalina.sh

# Expose port (default 8080, configurable via SERVER_PORT env)
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]
