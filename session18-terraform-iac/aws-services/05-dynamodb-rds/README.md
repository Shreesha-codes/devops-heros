# 05. DynamoDB & RDS - Database Services

## DynamoDB
Amazon DynamoDB is a fully managed, serverless, key-value NoSQL database designed to run high-performance applications at any scale.

### NoSQL
NoSQL databases are non-tabular databases and store data differently than relational tables. DynamoDB is flexible and schema-less.

### Tables
A table is a collection of items. Like other database systems, DynamoDB stores data in tables.

### Items
An item is a group of attributes that is uniquely identifiable among all of the other items. It's similar to a row in a relational database.

### Attributes
An attribute is a fundamental data element, something that does not need to be broken down any further. It's similar to a column in a relational database.

### Partition key
A simple primary key, composed of one attribute known as the partition key. DynamoDB uses the partition key's value as input to an internal hash function to determine the physical storage internal to DynamoDB.

### Sort key
A composite primary key, composed of two attributes: the partition key and the sort key. It allows storing multiple items with the same partition key, sorted by the sort key.

### Use cases
- Serverless applications.
- High-traffic web apps (e-commerce carts, session management).
- Gaming leaderboards and player data.
- IoT device data.

## RDS
Amazon Relational Database Service (Amazon RDS) is a collection of managed services that makes it simple to set up, operate, and scale databases in the cloud.

### Relational database
A relational database is a collection of data items with pre-defined relationships between them. These items are organized as a set of tables with columns and rows.

### Supported engines
RDS supports several database engines:
- Amazon Aurora
- PostgreSQL
- MySQL
- MariaDB
- Oracle Database
- SQL Server

### DB instances
A DB instance is an isolated database environment in the cloud. It is the basic building block of Amazon RDS.

### Security
RDS provides security at multiple levels: VPC for network isolation, IAM for access control, security groups for firewall rules, and encryption at rest and in transit.

### Backups
RDS provides automated backups and manual DB snapshots. Automated backups allow point-in-time recovery for a specified retention period.

### Multi-AZ
Multi-AZ deployments provide enhanced availability and durability for DB instances, making them a natural fit for production database workloads. RDS automatically provisions and maintains a synchronous standby replica in a different Availability Zone.

### Read replicas
Read replicas allow you to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads.

### Use cases
- Traditional enterprise applications (ERP, CRM).
- E-commerce platforms needing complex transactions.
- Web and mobile applications needing complex querying.
