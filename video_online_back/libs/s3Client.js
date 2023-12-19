const AWS = require("aws-sdk");
// Set the AWS Region.
const REGION = "eu-central-1"; //e.g. "us-east-1"
// Create an Amazon S3 service client object.
const s3 = new AWS.S3({ region: REGION });
// const s3Client = new S3Client({ region: REGION });

module.exports = s3;