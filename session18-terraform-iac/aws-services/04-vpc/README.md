# 04. VPC - Networking

## What is VPC?
Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

## CIDR
Classless Inter-Domain Routing (CIDR) is a method for allocating IP addresses and IP routing. When you create a VPC, you assign an IPv4 CIDR block (e.g., 10.0.0.0/16).

## Subnets
A subnet is a range of IP addresses in your VPC. You can launch AWS resources into a specified subnet. Subnets can be public, private, or VPN-only.

## Route tables
A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet or gateway is directed.

## Internet Gateway
An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.

## NAT Gateway
A NAT (Network Address Translation) gateway enables instances in a private subnet to connect to the internet or other AWS services, but prevents the internet from initiating a connection with those instances.

## Security Groups
Security groups act as a virtual firewall for associated EC2 instances, controlling both inbound and outbound traffic at the instance level.

## Network ACLs
A network access control list (ACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets. It operates at the subnet level.

## Public vs private subnet
- **Public subnet**: The subnet's route table has a route to an internet gateway, allowing resources to access the internet directly.
- **Private subnet**: The subnet's route table does not have a route to an internet gateway. Resources need a NAT gateway or NAT instance to access the internet.
