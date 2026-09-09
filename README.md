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
