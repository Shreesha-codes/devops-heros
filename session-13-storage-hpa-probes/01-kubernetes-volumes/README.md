# Kubernetes Volumes Documentation

## emptyDir
An `emptyDir` volume is first created when a Pod is assigned to a node, and exists as long as that Pod is running on that node. It is initially empty. All containers in the Pod can read and write the same files in the `emptyDir` volume. When a Pod is removed from a node for any reason, the data in the `emptyDir` is deleted permanently.
Example use cases: scratch space, checkpointing a long computation.

## hostPath
A `hostPath` volume mounts a file or directory from the host node's filesystem into your Pod. This is not something that most Pods will need, but it offers a powerful escape hatch for some applications.
Example: Running a container that needs access to Docker internals; running cAdvisor in a container.

## PersistentVolume (PV)
A `PersistentVolume` (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. It is a resource in the cluster just like a node is a cluster resource. PVs are volume plugins like Volumes, but have a lifecycle independent of any individual Pod that uses the PV.

## PersistentVolumeClaim (PVC)
A `PersistentVolumeClaim` (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). Claims can request specific size and access modes.

## StorageClass
A `StorageClass` provides a way for administrators to describe the "classes" of storage they offer. Different classes might map to quality-of-service levels, or to backup policies, or to arbitrary policies determined by the cluster administrators. 

## Dynamic Provisioning
Dynamic volume provisioning allows storage volumes to be created on-demand. Without dynamic provisioning, cluster administrators have to manually make calls to their cloud or storage provider to create new storage volumes, and then create `PersistentVolume` objects to represent them in Kubernetes. With dynamic provisioning, a user requesting a PVC will automatically trigger the creation of a PV and the actual storage backend using the `StorageClass`.
