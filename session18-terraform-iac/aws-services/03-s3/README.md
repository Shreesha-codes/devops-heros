# 03. S3 - Storage

## What is S3?
Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. You can use it to store and protect any amount of data for a range of use cases.

## Buckets
A bucket is a container for objects stored in Amazon S3. Every object is contained in a bucket. Buckets have a globally unique name.

## Objects
Objects are the fundamental entities stored in Amazon S3. An object consists of object data and metadata. The metadata is a set of name-value pairs that describe the object.

## Storage classes
Amazon S3 offers a range of storage classes designed for different use cases:
- S3 Standard: For general-purpose, frequently accessed data.
- S3 Intelligent-Tiering: For data with unknown or changing access patterns.
- S3 Standard-IA (Infrequent Access): For long-lived, but less frequently accessed data.
- S3 One Zone-IA: For long-lived, infrequent access, non-critical data.
- S3 Glacier (Instant, Flexible, Deep Archive): For long-term archiving.

## Versioning
Versioning allows you to keep multiple variants of an object in the same bucket. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket, protecting against accidental deletion or overwrites.

## Lifecycle policies
S3 Lifecycle configuration enables you to specify the lifecycle management of objects in a bucket. You can configure rules to transition objects to cheaper storage classes or expire (delete) them after a certain period.

## Encryption
Amazon S3 provides data encryption to protect your data at rest and in transit. You can use server-side encryption (SSE-S3, SSE-KMS, SSE-C) or client-side encryption.

## Bucket policies
Bucket policies are resource-based IAM policies that you attach to S3 buckets. They allow you to manage access to buckets and the objects in them across your entire AWS account or from other accounts.

## Common use cases
- Backup and restore.
- Data lakes and big data analytics.
- Static website hosting.
- Media hosting and content distribution.
- Software delivery.
