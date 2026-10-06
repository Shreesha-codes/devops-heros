# Session 8: Docker Networking & Volume Homework

## Task 1: Docker Container Networking
I successfully created 3 separate containers (Frontend, Backend, Database) and 3 different Docker networks. I attached the Backend container to two different networks so it could communicate with both the Frontend and the Database.

### Network Setup & Connectivity Test
![alt text](image.png)

---

## Task 2: Host Network
I pulled the Apache2 image and ran a container using the host's networking stack (`--network host`).

### Apache Website on Host Network
![alt text](image-1.png)

![alt text](image-2.png)
---

## Task 3: Bind Mount
I created a local folder with an `index.html` file and bind-mounted it to an Nginx container. I verified that changes made to the file locally instantly update inside the container without restarting it.

### 1. Initial Bind Mount
*(Attach a screenshot here showing the Nginx page displaying "Hello students")*

### 2. Live Update (No Restart Required)
![alt text](image-3.png)

---

## Task 4: My Overlay Network Research

**What I learned about Overlay Networks:**
While doing my research for this task, I found out that a Docker overlay network is basically a distributed network that spans across multiple different Docker hosts. It's really cool because it allows containers that are sitting on entirely different physical servers to talk to each other securely, just as if they were running on the exact same local machine.

**Where it's actually used:**
- **Docker Swarm:** From what I read, overlay networks are the default way that Swarm services communicate across different nodes in a cluster.
- **High Availability:** If I were deploying a microservice architecture across multiple VMs, using an overlay network would ensure that all my microservices could resolve and talk to each other seamlessly, without me having to expose their internal ports to the public internet.
