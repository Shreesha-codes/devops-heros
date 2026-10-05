# FQDN in Kubernetes

### What is FQDN?
FQDN stands for Fully Qualified Domain Name. It represents the complete domain name for a specific computer or host on the internet or a private network, specifying its exact location in the tree hierarchy of the Domain Name System (DNS).

### Kubernetes Service DNS
When you create a Service in Kubernetes, it automatically creates a corresponding DNS entry. This allows pods to find services by name instead of IP address.

### Kubernetes DNS naming convention
The standard naming convention for a Kubernetes Service is:
`service-name.namespace.svc.cluster.local`

### Namespace-based DNS
- **Same Namespace**: If a Pod is trying to reach a Service in the same namespace, it can just use the `<service-name>`.
- **Different Namespace**: If reaching across namespaces, you must include the namespace in the DNS request: `<service-name>.<namespace>`.

### Pod-to-Service communication
Pods communicate with Services by making network requests to the Service's DNS name. CoreDNS resolves this name to the Service's ClusterIP, and kube-proxy routes the traffic to the appropriate backend Pods.

### Examples of Kubernetes FQDNs
- `my-service.default.svc.cluster.local`
- `db-service.production.svc.cluster.local`
- `web-frontend.staging.svc.cluster.local`
