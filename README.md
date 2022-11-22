# superrepo

# Amazon s3-website

## overview

create a amazon s3 website & deploy it on aws.

# Requirements

| Name | Version |
|------|---------|
| GitHub |	>= 3.7.0 |
| aws |	>= CLI v2 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> CLI v2|


# s3-website

Easily publish static websites to Amazon S3. TLS encryption can be enabled via Cloudfront.

Creates a bucket with the specified name and enables static website hosting on it. Also, sets up a public-read bucket policy.

Your AWS credentials should either be in ~/.aws/credentials, a file in the local directory entitled .env with the values

 AWS_ACCESS_KEY_ID: "${{ secrets.AWS_ACCESS_KEY_ID }}"
 AWS_DEFAULT_REGION: "${{ secrets.AWS_DEFAULT_REGION }}"
 AWS_SECRET_ACCESS_KEY: "${{ secrets.AWS_SECRET_KEY_ID }}"

or in the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.

Your website policy and configuration will only be sent to S3 when it differs from the existing. 

# Buket Policy

The bucket policy, written in JSON, provides access to the objects stored in the bucket. Bucket policies don't apply to objects owned by other accounts. 

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::Bucket_Name",
                "arn:aws:s3:::Bucket_Name/*"
            ]
        }
    ]
} 



# Code Examples
 

If your credentials are incorrect, this function will return an error. Otherwise, it will return a list of information about the buckets you have access to.

At the root of your project, create .github/workflow directories. Then, create .yml file. You can name it as you want.
I set it as build-deploy.yml . Checkout the GitHub Action Documentation to set the content of the .yml file.

runs-on: ubuntu-latest
    container:
      image: nikolaik/python-nodejs:python3.7-nodejs14
    steps:
    - name: Install AWS CLI v2
      run: |
          curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/awscliv2.zip
          unzip -q /tmp/awscliv2.zip -d /tmp
          rm /tmp/awscliv2.zip
           /tmp/aws/install --update
          rm -rf /tmp/aws/
    - name: Deploy static site to S3 bucket
      run: aws s3 sync .  s3://${{ secrets.BUCKET_NAME }} --acl public-read

checkout > cache node_modules > AWS CLI config > set Node > install dependencies > build > deploy.

# Usage

   1. index.html should be renamed to whatever you've configured the "Index Document" to be in your S3 website bucket.

   2. Copy the files into the directory that you'd like to provide a listing for.

   3. Make sure that the bucket has List permission for Everyone, and that the files are publicly readable.

## Make a change and Deploy

Now that your Action is configured, change a little thing visible on your website and push this change to the main branch.

Then go to the Actions section of your GitHub repository and observe the steps being executed!

## resource

https://towardsaws.com/build-a-simple-devops-pipeline-from-github-to-aws-s3-for-static-website-911c620dce31

https://aws.plainenglish.io/hosting-a-static-website-with-s3-cloudfront-7450ba2a203f

https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html

