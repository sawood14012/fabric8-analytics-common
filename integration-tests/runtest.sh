#!/bin/bash -ex
if [ ! -f /var/run/docker.pid ]
then
    echo "!!! Docker service is probably not running !!!"
fi
function prepare_venv() {
	virtualenv -p python3 venv && source venv/bin/activate && python3 `which pip3` install -r requirements.txt
}
[ "$NOVENV" == "1" ] || prepare_venv || exit 1
export RECOMMENDER_REFRESH_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6InpELTU3b0JGSU1VWnNBV3FVbklzVnVfeDcxVklqZDFpckdrR1VPaVRzTDgiLCJ0eXAiOiJKV1QifQ.eyJhbGxvd2VkLW9yaWdpbnMiOlsiaHR0cHM6Ly9hdXRoLnByb2QtcHJldmlldy5vcGVuc2hpZnQuaW8iLCJodHRwczovL3Byb2QtcHJldmlldy5vcGVuc2hpZnQuaW8iXSwiYXBwcm92ZWQiOnRydWUsImF1ZCI6Imh0dHBzOi8vcHJvZC1wcmV2aWV3Lm9wZW5zaGlmdC5pbyIsImF1dGhfdGltZSI6MTYwNDkyMzQzNSwiY29tcGFueSI6IlJlZGhhdCIsImVtYWlsIjoibXNhd29vZCtwcmV2aWV3M0ByZWRoYXQuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImV4cCI6MTYwNzUxNTQzNSwiZmFtaWx5X25hbWUiOiJTYXdvb2QiLCJnaXZlbl9uYW1lIjoiTWVlciIsImlhdCI6MTYwNDkyMzQzNSwiaXNzIjoiaHR0cHM6Ly9hdXRoLnByb2QtcHJldmlldy5vcGVuc2hpZnQuaW8iLCJqdGkiOiI4YTg2Mjk2Yy1hODIyLTRhYTktYmY3MC02OGE3MDIyNjU2NjQiLCJuYW1lIjoiTWVlciBTYXdvb2QiLCJuYmYiOjAsInByZWZlcnJlZF91c2VybmFtZSI6Im1zYXdvb2QtcHJldmlldzMiLCJzZXNzaW9uX3N0YXRlIjoiOTQ0MzhhMzgtNDlkMy00ZTEzLWE2OGMtN2Q2YTA2NWI5OGIwIiwic3ViIjoiNDdlNzAzNjktNDUxOS00N2I3LTk1MDItYmFmZDkyODc4OWIxIiwidHlwIjoiQmVhcmVyIn0.YvT4R1jM7NDP2nKzZdRdM8xFY9wyJEIAgEgpLE6gk_aUEnqj_034A9nRVOdafklSo5_5z19sknfffUiTfgw3TpaXLFKGmQ-SY4spdkFQ4ohbw44f34gCJPrXd44ygbkif3EEaz9cn_RZ_CGRmpkvdhX1Ov9iYqsL4jg75utCSZ63phXLaYln8Gw-zIDvpdqgaQ5nOGcQdWH3c5glyiaSefiMFpYv32SOE0hsxzcQv-uK3c6l1PfqCRsWu63Zf5koTZI-CAmgrTNnTp65kjjz6rw-5-M-07ijg3xxPc7Ijx9nS08K5eTJmG_wVo58PfI6AGjyWk0ryTTPu47RnZQX5Q"
export THREE_SCALE_PREVIEW_USER_KEY="3e42fa66f65124e6b1266a23431e3d08"
export F8A_API_V2_URL="https://f8a-analytics-preview-2445582058137.staging.gw.apicast.io"
export F8A_API_URL="https://recommender.api.prod-preview.openshift.io"
export F8A_JOB_API_URL="http://bayesian-jobs-bayesian-preview.b6ff.rh-idev.openshiftapps.com"
export OSIO_AUTH_SERVICE="https://auth.prod-preview.openshift.io"
export F8A_THREE_SCALE_PREVIEW_URL="https://f8a-analytics-preview-2445582058137.production.gw.apicast.io"
export F8A_SERVICE_ID="2555417754383"
export F8A_GREMLIN_URL="http://bayesian-gremlin-http-preview-b6ff-bayesian-preview.b6ff.rh-idev.openshiftapps.com/"
export F8A_GEMINI_API_URL="https://gemini.api.prod-preview.openshift.io/"
export AWS_ACCESS_KEY_ID="not-set"
export AWS_SECRET_ACCESS_KEY="not-set"
export S3_REGION_NAME="us-east-1"
export SNYK_TOKEN="6e1dafe6-adf7-41cf-99a3-82df25fa04ae"
export REGISTERED_USER_UUID="ba6e4fda-ad0c-4f31-81d6-5cc2f27e2465"
export DEVELOPER_ANALYTICS_REPORTS_BUCKET="public-dynamic-manifests"
export MANIFESTS_BUCKET_URL="https://public-dynamic-manifests.s3.amazonaws.com/"
export F8A_3SCALE_URL="https://3scale-connect.api.prod-preview.openshift.io/"
PYTHONDONTWRITEBYTECODE=1 python3 `which behave` --tags=-skip  -D dump_errors=true @feature_list.txt $@