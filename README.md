<h1 align="center">
       ✨  Gym Management System  ✨
</h1>

<div align="center">

![Badge](https://img.shields.io/badge/Tech_Stack-Java-red) ![Badge](https://img.shields.io/badge/JSP-blue) ![Badge](https://img.shields.io/badge/CSS-orange)
 ![Badge](https://img.shields.io/badge/-JS%20-blue)
</div>

<br />

## Tech Stack : 

- **Frontend:** CSS, JavaScript, JSP
- **Backend:** Java, Spring Boot, Spring Framework, Spring Data JPA, Spring Security
- **Database:** MySQL, HQL 
- **Build Tool:** Maven
- **Code Editor and tools:** Eclipse IDE
- **Server:** Tomcat

 <br />

   <p align="center">
    ✨ Welcome to Gym Management System ✨ <br />
 
</p>

   
## Table of Contents:

    - Overview
    - ER Diagram
    - UI of Website

 <br />


## Overview 🔨

Gym Management System project features user authentication, slot scheduling, availability management, booking info management, feedback and an admin dashboard. Built with a Java full stack, it ensures efficient gym management operations.

  <br />

  ## ER Diagram:
  
| ![ERD](https://github.com/user-attachments/assets/e4c990b8-5549-4627-ab04-c2c0e6527cf4) |
|-|

  </br>

## UI of the Website:
  Click on the image to watch it.

| ![LoginPage](https://github.com/user-attachments/assets/f1c05d0a-d29e-4768-8f31-b0560cea067d) | ![RegistrationPage](https://github.com/user-attachments/assets/d644e4a1-d613-4957-b04f-3b09aed6a3a8) |
|-|-|
| Login Page | Registration Page | 

Admin Side:
| ![AdminSideHomePage](https://github.com/user-attachments/assets/b65d4195-4525-490f-801b-5e0c067fe7df) | ![AddItem](https://github.com/user-attachments/assets/a808d285-7e4f-44a5-9b0e-ea0295b81bcd) |
|-|-|
| Home Page | Add GymItem | 
| ![slotBookingbyAdmin](https://github.com/user-attachments/assets/24fdc6cf-28f9-445a-973b-6c500ea467f8) | ![ViewBooking](https://github.com/user-attachments/assets/e868ae24-1f05-48e5-84e7-d19442068896) |
| Slot Booking By Admin | Manage Booking | 
| ![Users](https://github.com/user-attachments/assets/de4c85c9-d2cf-4a25-b4c1-e03f11029c2e) | ![UsersFeedback](https://github.com/user-attachments/assets/ef7e1a18-c0d5-42af-9628-369d775d394a) |
| Manage Users | View Feedbacks | 

</br>

Member Side:
| ![AboutPage](https://github.com/user-attachments/assets/2c6d6331-bf78-46f7-bf3b-5b5befc5c584) | ![ViewSlot](https://github.com/user-attachments/assets/39614c71-fcc3-4279-8c2e-97bd940aaa69) |
|-|-|
| About Page | View Slot | 
| ![CancelBooking](https://github.com/user-attachments/assets/3aba4be3-bf48-47ae-8432-8a9a9212e24f) | ![Feedback](https://github.com/user-attachments/assets/6cc1ab85-e315-46ca-b1f4-a1af14a8c0e5) |
| Cancel Booking | Feedback |

<br/>

## 🚀 CI/CD & Deployment Setup

### GitHub Actions Workflow

This project includes automated CI/CD pipeline configured in `.github/workflows/ci-deploy.yml` that:

1. **Build & Test** - Runs on every push and pull request
   - Checks out code
   - Sets up Java 17 & Maven
   - Runs all unit tests
   - Builds the WAR package
   - Uploads build artifacts

2. **Deploy to Heroku** - Runs after successful build on `master` branch
   - Builds Docker image from Dockerfile
   - Pushes to Heroku Container Registry
   - Releases the new version

3. **Deploy to Render** - Runs after successful build on `master` branch
   - Builds and pushes Docker image
   - Triggers Render deployment via webhook or native integration

### Prerequisites & Setup

#### Local Development

1. **Install Dependencies**
   ```bash
   # Java 17
   # Maven 3.8+
   # MySQL Server
   # Docker (for local testing)
   ```

2. **Configure Database**
   - Create MySQL database: `GymDB`
   - Update connection string in `gymManagementSystem/src/main/resources/application.properties`
   - Default: `jdbc:mysql://localhost:3306/GymDB`

3. **Build Locally**
   ```bash
   cd gymManagementSystem
   mvn clean package
   ```

4. **Docker Build (Local Testing)**
   ```bash
   cd gymManagementSystem
   docker build -t gymms-app:latest .
   docker run -p 8080:8080 \
     -e SPRING_DATASOURCE_URL=jdbc:mysql://host.docker.internal:3306/GymDB \
     -e SPRING_DATASOURCE_USERNAME=root \
     -e SPRING_DATASOURCE_PASSWORD=your_password \
     -e SERVER_PORT=8080 \
     gymms-app:latest
   ```
   
   Then access: http://localhost:8080/

#### GitHub Secrets Configuration

Add these secrets to your GitHub repository:

1. **Settings > Secrets and variables > Actions > New repository secret**

2. **Heroku Deployment Secrets:**
   - `HEROKU_API_KEY` - Your Heroku API key (get from Account Settings > API key)
   - `HEROKU_APP_NAME` - Your Heroku app name (e.g., `my-gym-app`)

3. **Render Deployment Secrets:**
   - `RENDER_API_KEY` - Your Render API key (get from Render Dashboard > Account > API keys)
   - `RENDER_SERVICE_ID` - Your Render service ID (found in Render dashboard)
   - `RENDER_DEPLOY_WEBHOOK` - Webhook URL for deployment (optional)
   - `RENDER_IMAGE_URL` - Docker image registry URL (optional)

#### Heroku Setup

1. **Create Heroku App**
   ```bash
   heroku create my-gym-app
   heroku config:set SPRING_DATASOURCE_URL=mysql://...
   heroku config:set SPRING_DATASOURCE_USERNAME=root
   heroku config:set SPRING_DATASOURCE_PASSWORD=your_password
   ```

2. **Enable Container Registry Login**
   - Install Heroku CLI: `npm install -g heroku`
   - Login: `heroku login`
   - Authenticate container registry: `heroku container:login`

3. **Manual Deployment (Container)**
   ```bash
   cd gymManagementSystem
   docker build -t gymms-app:latest .
   docker tag gymms-app:latest registry.heroku.com/my-gym-app/web:latest
   docker push registry.heroku.com/my-gym-app/web:latest
   heroku container:release web --app=my-gym-app
   ```

4. **Alternative: Buildpack Deployment**
   - Uses `Procfile` (included in repo)
   - Push to Heroku: `git push heroku master`
   - Note: Requires converting WAR to JAR packaging

#### Render Setup

1. **Create Render Service**
   - Go to https://dashboard.render.com
   - Create new Web Service
   - Connect GitHub repo (Prachichhatrola/gymManagementSystem)
   - Configure environment variables

2. **Environment Variables on Render**
   ```
   SPRING_DATASOURCE_URL=mysql://your_db_host/GymDB
   SPRING_DATASOURCE_USERNAME=root
   SPRING_DATASOURCE_PASSWORD=your_password
   SERVER_PORT=8080
   SPRING_PROFILES_ACTIVE=prod
   ```

3. **Database Configuration**
   - Use Render's Managed PostgreSQL OR
   - Connect external MySQL database
   - Update SPRING_DATASOURCE_URL with correct connection string

4. **Manual Trigger Deployment**
   - Push to `master` branch → CI/CD pipeline runs automatically
   - Or manually trigger in Render dashboard

### Environment Variables

See `.env.example` for all available environment variables. In production:
- **Never commit secrets** to the repository
- Use GitHub Secrets for CI/CD
- Use platform-specific secret management (Heroku Config Vars, Render Environment Variables)

### Troubleshooting

**Build Fails in CI:**
- Check Java version (requires 17)
- Verify Maven cache
- Review test failures: `mvn test`

**Docker Build Fails:**
- Ensure Maven build passes locally first
- Check Docker daemon is running
- Review Dockerfile for any missing dependencies

**Heroku Deployment Fails:**
- Verify HEROKU_API_KEY has correct permissions
- Check app name is correct
- Review logs: `heroku logs --tail --app=my-gym-app`

**Render Deployment Fails:**
- Check RENDER_API_KEY permissions
- Verify database connection string
- Review logs in Render dashboard

### Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Heroku Container Registry](https://devcenter.heroku.com/articles/container-registry-and-runtime)
- [Render Deployment Guide](https://docs.render.com/deploy-from-github)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Docker Documentation](https://docs.docker.com/)

