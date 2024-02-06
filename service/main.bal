import ballerina/io;
import ballerinax/aws.s3;


s3:ConnectionConfig amazonS3Config = {
    accessKeyId: AWSAccessKeyId,
    secretAccessKey: AWSSecretAccessKey,
    region: AWSRegion
};
s3:Client amazonS3Client = check new (amazonS3Config);

s3:ObjectRetrievalHeaders objectRetrievalHeaders = {
    range: "bytes=0-100"
};

public function main() {
    error? streamObjectResult = streamObject(amazonS3Client, AWSBucketName, "wso2carbon.log");
}

public function streamObject(s3:Client amazonS3Client, string bucketName, string filename) returns error? {
    stream<byte[], io:Error?>|error getObjectResponse = amazonS3Client->getObject(bucketName, filename, objectRetrievalHeaders);
    if (getObjectResponse is error) {
        return getObjectResponse;
    }
    // Get the object stream and read the content
    

}
