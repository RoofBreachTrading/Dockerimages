# if config is not set: return

# Required config:
# - Metric name
# - Namespace name
# - Login (id/secret)
# - Region

# If config exists:
 # Setup the command used for pushing the logs
 # aws cloudwatch put-metric-data --metric-name PageViewCount --namespace MyService --value 2 --timestamp 2016-10-14T12:00:00.000Z
 # Get the logs
 # Push the logs
