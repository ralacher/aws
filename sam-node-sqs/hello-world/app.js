const AWS = require('aws-sdk');
const s3 = new AWS.S3();
let response;

/**
 *
 * Event doc: https://docs.aws.amazon.com/lambda/latest/dg/with-sqs-example.html#with-sqs-create-test-function
 * @param {Object} event - SQS Input Format
 *
 * Context doc: https://docs.aws.amazon.com/lambda/latest/dg/nodejs-prog-model-context.html 
 * @param {Object} context
 * 
 */
exports.lambdaHandler = async (event, context) => {
    // Read the event and log some information
    try {
        console.log(`# Records ${event.Records.length}`);
    } catch (err) {
        console.log(err);
    }

    // Persist the queue item to S3
    try {
        outputs = []
        event.Records.forEach(data => {
            const destParams = {
                Bucket: 'rlacher',
                Key: `${data.messageId}.json`,
                Body: data.body,
                ContentType: 'application/json'
            };
            outputs.push(destParams);
            console.log(`Reading message ${data.messageId}`);
        });
        await Promise.all(outputs.map(async (data) => {
            const result = await s3.putObject(data).promise();
            console.log(`Uploaded message ${data.Key}`);
        }));

    } catch (error) {
        console.log(error);
    }
};
