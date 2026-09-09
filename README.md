# AWS VPC with Terraform

Production-oriented AWS VPC architecture implemented using Terraform.

This project demonstrates how to design, provision, and manage a secure, highly available, and reusable AWS networking foundation using Infrastructure as Code (IaC).

The architecture is designed to provide a foundation for hosting application workloads across multiple Availability Zones while maintaining separation between public and private resources.

---
##  Architecture

The VPC uses a multi-Availability Zone architecture with dedicated public and private subnets.

### High-Level Architecture


                              Internet
                                  │
                                  ▼
                        ┌──────────────────┐
                        │ Internet Gateway  │
                        └────────┬─────────┘
                                 │
               ┌─────────────────┴─────────────────┐
               │                                   │
        Availability Zone A                Availability Zone B
               │                                   │
        ┌──────┴──────┐                     ┌──────┴──────┐
        │             │                     │             │
        ▼             ▼                     ▼             ▼
    Public-A      Private-A             Public-B      Private-B
    10.0.1.0/24   10.0.11.0/24           10.0.2.0/24   10.0.12.0/24
        │             │                     │             │
        ▼             │                     ▼             │
    NAT Gateway A ────┘                 NAT Gateway B ────┘
        │                                   │
        └─────────────────┬─────────────────┘
                          │
                       Internet
Project Objectives

The primary objectives of this project are to:

Design a production-oriented AWS VPC
Implement multi-AZ networking
Separate public and private workloads
Provide controlled outbound Internet access
Implement reusable Terraform modules
Support development and production environments
Apply AWS networking and security best practices
Automate infrastructure validation
Document architecture and design decisions
Demonstrate Infrastructure as Code practices
☁️ AWS Services

This project uses the following AWS services:

Amazon VPC
Subnets
Internet Gateway
NAT Gateway
Route Tables
Security Groups
Network ACLs
VPC Flow Logs
Amazon S3
S3 Gateway VPC Endpoint
AWS Identity and Access Management (IAM)
🌐 Network Design
VPC CIDR
10.0.0.0/16
Public Subnets
Availability Zone	CIDR
AZ-A	10.0.1.0/24
AZ-B	10.0.2.0/24
Private Subnets
Availability Zone	CIDR
AZ-A	10.0.11.0/24
AZ-B	10.0.12.0/24

The CIDR structure leaves room for future expansion while keeping the initial network layout simple and easy to understand.

🔀 Routing Architecture
Public Subnets

Public subnets use a route table with:

Destination       Target
10.0.0.0/16       local
0.0.0.0/0         Internet Gateway
Private Subnets

Private subnets use NAT Gateways for controlled outbound Internet connectivity.

Destination       Target
10.0.0.0/16       local
0.0.0.0/0         NAT Gateway

Each production Availability Zone is designed to use its own NAT Gateway to reduce cross-AZ dependency and improve resilience.

🔐 Security

Security is a key consideration in this architecture.

The design follows a defense-in-depth approach including:

Private subnets for application workloads
Security Groups for workload-level traffic control
Network ACLs for subnet-level controls
VPC Flow Logs for network visibility
Least-privilege IAM access
Controlled Internet access
Resource tagging
No unnecessary public exposure of private workloads
📊 Observability

VPC Flow Logs will be included to provide visibility into network traffic.

The project will explore:

Traffic visibility
Network troubleshooting
Accepted and rejected traffic
Security investigation
Operational monitoring
🔗 VPC Endpoints

An Amazon S3 Gateway VPC Endpoint will be used to demonstrate private connectivity from workloads to S3 without requiring Internet Gateway or NAT Gateway connectivity for that S3 traffic.

This also provides an opportunity to explore AWS networking patterns for private workloads.

💰 Cost Considerations

AWS networking components can generate costs, particularly:

NAT Gateways
NAT Gateway data processing
Cross-AZ data transfer
VPC Flow Logs
Other data-processing services

The project will therefore include separate considerations for development and production environments.

Development

The development environment will prioritize cost optimization.

Production

The production environment will prioritize:

High availability
Fault isolation
Multi-AZ resilience
Operational visibility

Cost versus resilience trade-offs will be documented as part of the project.

🧱 Terraform Architecture

The Terraform configuration is designed around reusable infrastructure components and environment separation.

Planned structure:

aws-vpc-terraform/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── architecture/
│   └── aws-vpc-architecture.png
│
├── modules/
│   └── vpc/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
│
├── environments/
│   ├── dev/
│   └── prod/
│
├── docs/
│   ├── architecture.md
│   ├── security.md
│   └── cost.md
│
└── .github/
    └── workflows/
        └── terraform.yml

The project is structured to promote:

Reusability
Environment separation
Consistent deployments
Version-controlled infrastructure
Automated validation
Infrastructure documentation
🚀 Project Roadmap
 Create GitHub repository
 Define initial architecture
 Define network CIDR strategy
 Implement Terraform VPC module
 Create public subnets
 Create private subnets
 Configure Internet Gateway
 Configure NAT Gateways
 Configure route tables
 Add S3 VPC Endpoint
 Implement security controls
 Enable VPC Flow Logs
 Create development environment
 Create production environment
 Add Terraform validation
 Add Terraform formatting checks
 Add GitHub Actions CI/CD
 Add architecture diagram
 Document security considerations
 Document cost considerations
 Test infrastructure deployment
 Document lessons learned
🧪 Validation

The Terraform configuration will include automated validation for:

terraform fmt
terraform validate
terraform plan

Additional security and infrastructure scanning will be considered as the project evolves.

📚 Architecture Decisions

This project intentionally documents the reasoning behind infrastructure decisions rather than only providing Terraform code.

Topics will include:

Why multi-AZ?
Why public and private subnet separation?
Why NAT Gateway?
Why one NAT Gateway per AZ?
When should VPC endpoints be used?
How should CIDR ranges be planned?
How should development and production differ?
How should security groups be designed?
How can infrastructure costs be controlled?
🔄 Future Enhancements

Potential future enhancements include:

Application Load Balancer
EC2 or ECS workloads
RDS database subnet architecture
VPC peering
AWS Transit Gateway
Hybrid connectivity
AWS Network Firewall
Centralized logging
CloudWatch monitoring
Multi-account networking
Regional NAT Gateway comparison
📖 Learning & AWS Builder Journey

This project is part of my hands-on AWS learning and cloud architecture journey.

The goal is to build practical infrastructure, document architectural decisions, share engineering lessons, and continuously improve the implementation.

Build → Learn → Document → Share → Improve

👤 Author

Karthick Thiagarajan

Cloud & Infrastructure Architect | AWS | DevOps | Infrastructure as Code

With 20+ years of IT experience across cloud infrastructure, DevOps, automation, Infrastructure as Code, and enterprise architecture.

📄 License

This project is licensed under the Apache License 2.0.

