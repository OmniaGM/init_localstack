#!/usr/bin/env bash
awslocal dynamodb create-table \
            --attribute-definitions AttributeName=col1,AttributeType=S \
            --table-name test_table \
            --key-schema AttributeName=col1,KeyType=HASH \
            --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
            --region $AWS_DEFAULT_REGION
            