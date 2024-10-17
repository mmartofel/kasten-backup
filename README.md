
1. Setup Minio S3 instance

oc apply -k ./minio

2. Install Veem Kaster operator

oc apply -k ./operator

3. Annotate StorageClass to support 'Volume type = Block' PVC's to be exported to S3:

./operator/annotate-storage-class.sh

Note: 
virtual machines use 'Volume type = Block' PVC's


not important but of help at some point:

Minio API service url:

http://minio-service.minio.svc.cluster.local:9000


