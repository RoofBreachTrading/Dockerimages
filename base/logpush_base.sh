#!/bin/bash

if [[ "$RBT_LOG_STATE" == "disabled" ]]; then
    exit 0
fi

# if not initialized:
if [[ "$RBT_LOG_STATE" == "" ]]; then
    # if config is not set: return
    if [[ "$RBT_LOG_METRIC_NAME" == "" || "$RBT_LOG_NAMESPACE"  == "" || "$RBT_LOG_REGION" == "" || "$RBT_LOG_KEY_ID" == "" || "$RBT_LOG_ACCESS_KEY" == "" ]]; then
        RBT_LOG_STATE="disabled"
        exit 0
    fi

    # login to aws
    echo "[default]
    region=$RBT_LOG_REGION
    output=text" > ~/.aws/config
    echo "[default]
    aws_access_key_id=$RBG_LOG_KEY_ID
    aws_secret_access_key=$RBT_LOG_ACCESS_KEY" > ~/.aws/credentials

    RBT_LOG_STATE="enabled"
fi

# If config exists:
 # Get the logs
 VALUE=$(logpush.sh)
 # Push the logs
 aws cloudwatch put-metric-data --metric-name "$RBT_LOG_METRIC_NAME" --namespace "$RBT_LOG_NAMESPACE" --value "$VALUE"
