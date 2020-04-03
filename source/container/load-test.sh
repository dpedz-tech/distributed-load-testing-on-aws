
# set a uuid for the resultsxml file name in S3
UUID=$(cat /proc/sys/kernel/random/uuid)
echo "Dale test scenario"

echo "S3_BUCKET:: ${S3_BUCKET}"
echo "TEST_ID:: ${TEST_ID}"
echo "UUID ${UUID}"

# mydate=$(date '+%Y-%m-%d %H:%M:%S')
# echo "Download test scenario"
# aws s3 cp s3://$S3_BUCKET/test-scenarios/$TEST_ID.json test.json

echo "Running Selenium test"
# bzt test.json -o modules.console.disable=true
bzt load_page.yml

t=$(python -c "import random;print(random.randint(1, 30))")
echo "sleep for: $t seconds."
sleep $t

echo "Uploading results"
aws s3 cp /tmp/artifacts/results.xml s3://$S3_BUCKET/results/${TEST_ID}/${UUID}.xml
