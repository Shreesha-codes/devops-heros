# 02. EC2 - Compute

## What is EC2?
Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers.

## AMI
An Amazon Machine Image (AMI) provides the information required to launch an instance. You must specify an AMI when you launch an instance. You can launch multiple instances from a single AMI when you need multiple instances with the same configuration.

## Instance types
Amazon EC2 provides a wide selection of instance types optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity. Families include General Purpose, Compute Optimized, Memory Optimized, Accelerated Computing, and Storage Optimized.

## Key pairs
Amazon EC2 uses public-key cryptography to encrypt and decrypt login information. Public-key cryptography uses a public key to encrypt data, and a recipient uses the private key to decrypt the data. The public and private keys are known as a key pair.

## Security Groups
A security group acts as a virtual firewall for your EC2 instances to control incoming and outgoing traffic. Inbound rules control the incoming traffic to your instance, and outbound rules control the outgoing traffic from your instance.

## EBS
Amazon Elastic Block Store (Amazon EBS) provides block level storage volumes for use with EC2 instances. EBS volumes behave like raw, unformatted block devices. You can mount these volumes as devices on your instances.

## Public vs private IP
- **Public IP**: Reachable from the internet. Used for resources that need to be publicly accessible, like web servers.
- **Private IP**: Not reachable from the internet. Used for internal communication between resources within a VPC.

## Instance lifecycle
The EC2 instance lifecycle consists of different states: pending, running, stopping, stopped, shutting-down, and terminated. You can start, stop, hibernate, reboot, and terminate your instances.

## Common use cases
- Web hosting and web applications.
- Batch processing and big data analytics.
- Development and test environments.
- High-performance computing (HPC).
- Machine learning and AI workloads.
