# CoreDNS in Kubernetes

### What is CoreDNS?
CoreDNS is a flexible, extensible DNS server that can serve as the Kubernetes cluster DNS. It is written in Go and uses plugins to provide features.

### Why Kubernetes uses CoreDNS
Kubernetes uses CoreDNS to provide service discovery within the cluster. It translates human-readable Service names into ClusterIP addresses, allowing Pods to communicate without hardcoding IP addresses.

### How Service discovery works
1. A Service is created.
2. The Kubernetes API server notifies CoreDNS.
3. CoreDNS creates DNS records for the Service.
4. Pods query CoreDNS for the Service name to get the IP address.

### How DNS queries are resolved
1. A Pod makes a DNS request.
2. The request goes to the cluster's DNS service IP (usually handled by CoreDNS pods).
3. CoreDNS checks its plugins (specifically the `kubernetes` plugin).
4. If it's a known Service, it returns the internal IP. If not, it forwards the query to upstream DNS servers.

### CoreDNS configuration
CoreDNS is configured using a ConfigMap named `coredns` in the `kube-system` namespace. The main configuration file is the Corefile, which defines zones and plugins.

### How to troubleshoot DNS issues
1. Check if CoreDNS pods are running: `kubectl get pods -n kube-system -l k8s-app=kube-dns`
2. Check CoreDNS logs: `kubectl logs -n kube-system -l k8s-app=kube-dns`
3. Test DNS resolution from a pod: `kubectl run -it --rm --restart=Never busybox --image=busybox:1.28 -- nslookup <service-name>`
4. Verify the Service and Endpoints exist: `kubectl get svc`, `kubectl get endpoints`
