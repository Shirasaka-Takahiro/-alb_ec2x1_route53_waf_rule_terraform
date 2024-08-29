■Set-Up
1. Create S3 for tfstate
ex)example-dev-alb-accesslog-bucket

2. Generate public and private key

■Resources
<br />
EC2(web) x 1
<br />
ALb x 1(HTTP & HTTPS Listener)
<br />
Route53
<br />
ACM
<br />
WAF(Web ACL)
<br />
※associating to ALB and existing rule groups with arn

■Deploy
1. Move dev directory
2. terraform init
3. terraform plan
4. terraform apply