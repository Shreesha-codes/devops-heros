# Session 10: Kubernetes Pods, ReplicaSets & Deployments

This file contains the commands to create the necessary YAML files, execute deployments, and check the pod lifecycle. Run these commands in your PowerShell terminal within the `session10-k8s-core-objects` directory. Be sure to take screenshots where indicated and add them to this document!

---

## Task 1: Deployment Strategies

### 1. Rolling Update
A rolling update replaces Pods one by one without downtime.

**Create the YAML and apply it:**
```powershell
@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rolling-deployment
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  selector:
    matchLabels:
      app: rolling-app
  template:
    metadata:
      labels:
        app: rolling-app
    spec:
      containers:
      - name: app
        image: nginx:1.14.2
"@ | Out-File -FilePath rolling-deployment.yaml

# Apply the deployment
kubectl apply -f rolling-deployment.yaml

# Verify initial pods
kubectl get pods -l app=rolling-app
```

**Perform an update and verify (TAKE SCREENSHOT):**
```powershell
# Update the image to trigger a rolling update
kubectl set image deployment/rolling-deployment app=nginx:1.16.1

# Immediately check rollout status and pods
kubectl rollout status deployment/rolling-deployment
kubectl get pods -l app=rolling-app
```


### 2. Blue-Green Deployment
Blue-Green maintains two identical environments; only one is live at a time.

**Create Blue/Green Deployments and Service:**
```powershell
# Create Blue deployment (v1)
@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-blue
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
      version: v1
  template:
    metadata:
      labels:
        app: my-app
        version: v1
    spec:
      containers:
      - name: app
        image: nginx:1.14.2
"@ | Out-File -FilePath blue-deployment.yaml

# Create Green deployment (v2)
@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-green
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
      version: v2
  template:
    metadata:
      labels:
        app: my-app
        version: v2
    spec:
      containers:
      - name: app
        image: nginx:1.16.1
"@ | Out-File -FilePath green-deployment.yaml

# Create Service pointing to Blue
@"
apiVersion: v1
kind: Service
metadata:
  name: bg-service
spec:
  selector:
    app: my-app
    version: v1
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
"@ | Out-File -FilePath bg-service.yaml

# Apply them all
kubectl apply -f blue-deployment.yaml
kubectl apply -f green-deployment.yaml
kubectl apply -f bg-service.yaml
```

**Switch traffic and verify (TAKE SCREENSHOT):**
```powershell
# Verify active version is blue
kubectl get svc bg-service -o wide

# Switch traffic to Green by patching the service
kubectl patch service bg-service -p '{"spec":{"selector":{"version":"v2"}}}'

# Verify active version is now green
kubectl get svc bg-service -o wide
```


### 3. Canary Deployment
Canary releases a new version to a small percentage of users before a full rollout.

**Create Stable and Canary Deployments & Service:**
```powershell
# Create Stable deployment (3 replicas)
@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: stable-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: canary-demo
      track: stable
  template:
    metadata:
      labels:
        app: canary-demo
        track: stable
    spec:
      containers:
      - name: app
        image: nginx:1.14.2
"@ | Out-File -FilePath stable-deployment.yaml

# Create Canary deployment (1 replica - 25% traffic)
@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: canary-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: canary-demo
      track: canary
  template:
    metadata:
      labels:
        app: canary-demo
        track: canary
    spec:
      containers:
      - name: app
        image: nginx:1.16.1
"@ | Out-File -FilePath canary-deployment.yaml

# Create Service matching BOTH
@"
apiVersion: v1
kind: Service
metadata:
  name: canary-service
spec:
  selector:
    app: canary-demo
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
"@ | Out-File -FilePath canary-service.yaml

# Apply them
kubectl apply -f stable-deployment.yaml
kubectl apply -f canary-deployment.yaml
kubectl apply -f canary-service.yaml
```

**Verify traffic splitting (TAKE SCREENSHOT):**
```powershell
# Get all pods to show stable and canary running together
kubectl get pods -l app=canary-demo
```


### 4. Recreate Deployment
Recreate terminates all old pods before spinning up new ones. Causes downtime.

**Create Recreate Deployment:**
```powershell
@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: recreate-deployment
spec:
  replicas: 3
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: recreate-app
  template:
    metadata:
      labels:
        app: recreate-app
    spec:
      containers:
      - name: app
        image: nginx:1.14.2
"@ | Out-File -FilePath recreate-deployment.yaml

kubectl apply -f recreate-deployment.yaml
kubectl get pods -l app=recreate-app
```

**Update and observe (TAKE SCREENSHOT):**
```powershell
# Update image
kubectl set image deployment/recreate-deployment app=nginx:1.16.1

# Immediately get pods to see old ones terminating before new ones create
kubectl get pods -l app=recreate-app
```


---

## Task 2: Pod Lifecycle

Study how Pods move through states: Pending, Running, Succeeded/Failed.

**1. Normal Running Pod (Pending -> Running)**
```powershell
@"
apiVersion: v1
kind: Pod
metadata:
  name: lifecycle-running
spec:
  containers:
  - name: nginx
    image: nginx
"@ | Out-File -FilePath pod-running.yaml

kubectl apply -f pod-running.yaml
kubectl get pod lifecycle-running
kubectl describe pod lifecycle-running
```
*Explanation (Add Screenshot)*: The pod schedules successfully, pulls the image, and transitions to `Running`.

**2. Succeeded Pod (Pending -> Running -> Succeeded)**
```powershell
@"
apiVersion: v1
kind: Pod
metadata:
  name: lifecycle-succeeded
spec:
  restartPolicy: Never
  containers:
  - name: busybox
    image: busybox
    command: ['sh', '-c', 'echo Hello Kubernetes! && sleep 5']
"@ | Out-File -FilePath pod-succeeded.yaml

kubectl apply -f pod-succeeded.yaml
kubectl get pod lifecycle-succeeded --watch
```
*Explanation (Add Screenshot)*: The pod runs its command, finishes execution, and exits with code 0, moving to `Completed` (Succeeded) state because `restartPolicy` is Never.

**3. Failed Pod (ImagePullBackOff / ErrImagePull)**
```powershell
@"
apiVersion: v1
kind: Pod
metadata:
  name: lifecycle-failed
spec:
  containers:
  - name: typo-container
    image: nginx:invalid-tag-1234
"@ | Out-File -FilePath pod-failed.yaml

kubectl apply -f pod-failed.yaml
kubectl get pod lifecycle-failed
kubectl describe pod lifecycle-failed
```
*Explanation (Add Screenshot)*: The pod cannot pull the image because the tag does not exist. It transitions to `ImagePullBackOff` and fails to run.


## Final Step: Push to GitHub
Once you have run the commands, added screenshots to this file, and saved it:
```powershell
git add .
git commit -m "Complete Session 10 tasks"
git push origin assignments
```
