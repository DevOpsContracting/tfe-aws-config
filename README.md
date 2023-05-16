iam role
 They provide a way to define and manage sets of permissions that can be assumed by AWS services, applications, or users.

aws_iam_role_policy resource block
To attach an IAM policy to an IAM role. 

assume role policy
The first data block named assume_role allows the AWS Config service (config.amazonaws.com) to assume the IAM role by granting the sts:AssumeRole action. 

config policy
The second data block named is used to specify the permissions for the IAM role associated with AWS Config.

 Separating the IAM policy documents into different data blocks helps in organizing and managing the policies separately.