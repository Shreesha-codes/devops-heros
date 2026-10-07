# 01. IAM - Governance

## What is IAM?
AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources.

## Users
An IAM user is an entity that you create in AWS to represent the person or application that uses it to interact with AWS. A user consists of a name and credentials (password or access keys).

## Groups
An IAM group is a collection of IAM users. Groups let you specify permissions for multiple users, which can make it easier to manage the permissions for those users.

## Roles
An IAM role is an identity that you can create in your account that has specific permissions. An IAM role is similar to an IAM user, in that it is an AWS identity with permission policies that determine what the identity can and cannot do in AWS. However, instead of being uniquely associated with one person, a role is intended to be assumable by anyone who needs it.

## Policies
A policy is an object in AWS that, when associated with an identity or resource, defines their permissions. AWS evaluates these policies when an IAM principal (user or role) makes a request.

## Permissions
Permissions determine what users and roles can do in AWS. They are defined within policies and grant or deny access to AWS resources and actions.

## Least privilege
The principle of least privilege is the practice of granting only the permissions required to perform a task. This is a security best practice that reduces the risk of accidental or malicious actions.

## IAM best practices
- Lock away your AWS account root user access keys.
- Use IAM roles instead of long-term access keys for applications.
- Grant least privilege.
- Enable MFA (Multi-Factor Authentication) for privileged users.
- Use IAM Access Analyzer to generate least-privilege policies based on access activity.
- Regularly rotate access keys.

## Common use cases
- Managing access to AWS resources for employees.
- Granting cross-account access.
- Providing permissions to AWS services (like EC2 instances needing to read from S3).
- Federating users from a corporate directory (like Active Directory) to AWS.
