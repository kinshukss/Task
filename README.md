Here's a README.md file that provides clear instructions for using the four Docker-related files (frontend and backend Dockerfiles, Docker Compose, and the shell script) to run the application locally.

---

# *Full-Stack Application with Docker*

This project demonstrates how to run a full-stack application locally using Docker. The application consists of a *React frontend, **Express backend, and **MongoDB database, all containerized using Docker. With **Docker Compose*, you can start and manage all services at once. An included shell script automates the build, push, and deployment processes.

## *Project Structure*

- *Frontend Dockerfile*: Dockerfile to build the React frontend.
- *Backend Dockerfile*: Dockerfile to build the Express backend.
- *Docker Compose File*: Manages and orchestrates frontend, backend, and MongoDB containers.
- *Shell Script*: Automates the Docker build, push, and run commands.

## *Table of Contents*

- [Getting Started](#getting-started)
- [Docker Files](#docker-files)
  - [Frontend Dockerfile](#frontend-dockerfile)
  - [Backend Dockerfile](#backend-dockerfile)
  - [Docker Compose File](#docker-compose-file)
  - [Shell Script](#shell-script)
- [Running the Application](#running-the-application)
- [Testing and Access](#testing-and-access)
- [Troubleshooting](#troubleshooting)

---
## *Getting Started*

To run this application on your local machine, you’ll need:

- *Docker*: [Install Docker](https://docs.docker.com/get-docker/)
- *Docker Hub Account*: Optional if you want to push images to Docker Hub.

Clone the repository and navigate to the project root:

bash
git clone https://github.com/fliprlab/devops-task
cd devops-task


## *Docker Files*

### *1. Frontend Dockerfile*

The *frontend Dockerfile* builds and serves the React application:

- Uses a Node.js base image for the build.
- Copies the project files.
- Installs dependencies and builds the frontend app.
- Uses a lightweight server to serve the built files.

### *2. Backend Dockerfile*
The *backend Dockerfile* builds and runs the Express server:

- Uses a Node.js base image.
- Copies the project files.
- Installs dependencies.
- Exposes the required port and runs the backend server.

### *3. Docker Compose File*

The *docker-compose.yml* file in the root directory orchestrates the three services:

- *Frontend*: Maps to the frontend Dockerfile and exposes port 3000.
- *Backend*: Maps to the backend Dockerfile and exposes port 5000.
- *MongoDB*: Pulls an official MongoDB image, exposing port 27017 for database access.

### *4. Shell Script*

The **shell script (deploy.sh)** automates the following tasks:

- Builds and tags Docker images for the frontend and backend.
- Pushes these images to Docker Hub (if configured).
- Updates and runs the Docker Compose file to start the application.

Make the script executable:

bash
chmod +x deploy.sh

Run the script:

bash
./deploy.sh


## *Running the Application*

### *Option 1: Using Docker Compose*

1. *Build and start the application*:

   bash
   docker-compose up --build -d
   

   This will:
   - Build the frontend and backend Docker images.
   - Start containers for the frontend, backend, and MongoDB.
   - Set up network connections between the containers.

2. *Stop the application*:
bash
   docker-compose down
   

### *Option 2: Using the Shell Script*

Alternatively, run the deploy.sh script to automate the build, push, and deploy steps:

bash
./deploy.sh


This will:
- Build and push images to Docker Hub (if specified).
- Run docker-compose up to start the application.

*Note*: Make sure you have set up your Docker Hub credentials in the script if you plan to push images.

## *Testing and Access*

Once the application is running, access each service as follows:

- *Frontend*: [http://localhost:3000](http://localhost:3000) — React frontend interface.
- *Backend*: [http://localhost:5000](http://localhost:5000) — Express backend API.
- *API Endpoint*: [http://localhost:5000/api/users](http://localhost:5000/api/users) — Access the /api/users API for data.
## *Troubleshooting*

### *Common Issues*

- *Cannot GET /*: This means the backend’s root URL isn’t defined. Ensure your API requests use the correct paths (e.g., /api/users).
- *MongoDB Connection Errors*: Make sure the MongoDB service is running and accessible at the configured URI. The MONGO_URI should point to the correct MongoDB container.

### *Rebuilding Containers*

If you need to make changes to the application code and see them in the container, rebuild the images:

bash
docker-compose up --build -d


---

## *Contributing*

Contributions are welcome! Feel free to submit a pull request if you have suggestions or improvements.

---

## *License*
This project is licensed under the MIT License.
