'use strict';

const app = require('../../app.js');
const AWS = require('aws-sdk');
const s3 = new AWS.S3();
const event = require('../../../events/event.json')
const chai = require('chai');
const expect = chai.expect;
var context;

describe('Tests index', function () {
    it('verifies count of S3 objects', async () => {
        await app.lambdaHandler(event, context);

        const objects = [];
        const result = await s3.listObjects({
            Bucket: "rlacher"
        }).promise();
        result.Contents.forEach(data => {
            objects.push(data.Key);
        });
        expect(objects).to.have.lengthOf(2);
    });
});
