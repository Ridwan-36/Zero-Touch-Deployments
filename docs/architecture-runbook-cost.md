
## 2. Deployment Runbook

1. Create a feature branch and open a pull request.
2. GitHub Actions runs Terraform formatting, initialization, validation, linting and Docker build checks.
3. Merge approved changes to the deployment branch.
4. GitHub Actions authenticates to AWS using OIDC.
5. Build and push the container image to ECR.
6. Deploy approved staging infrastructure and ECS service.
7. Verify application health and CloudWatch logs.

## 3. Rollback and Recovery

- ECS deployment circuit-breaker rollback was configured.
- Review ECS service events and CloudWatch logs after deployment failure.
- Revert the deployment change and run the approved workflow.
- Rollback under 60 seconds was not independently measured.
- Production deployment was not performed.

## 4. Cost Estimate and Controls

Actual costs depend on AWS region, usage and runtime.

Main cost drivers:
- ECS Fargate vCPU and memory runtime
- Application Load Balancer
- ECR image storage
- CloudWatch logs and alarms
- KMS usage

Cost controls:
- Staging only; production was not deployed.
- No NAT Gateway.
- Limited CloudWatch log retention.
- Temporary staging infrastructure destroyed.
- Check AWS Billing before future deployments.

## 5. Final Cleanup Status

- Staging Terraform destroy: successful.
- S3 state bucket: deleted.
- DynamoDB lock table: deleted.
- Staging ECR repository: deleted.
- Final cleanup and leftover verification: successful.
- IAM OIDC role, OIDC provider and designated KMS key preserved.
- GitHub repository and submission evidence retained.
