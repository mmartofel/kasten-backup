#!/bin/bash

# Fetch the OpenShift API server URL
CLUSTER_API=$(oc get infrastructure cluster -o jsonpath='{.status.apiServerURL}')

# Construct the K10 dashboard URL dynamically
K10_DASHBOARD_URL="https://k10-route-kasten-io.$(oc get ingresses.config.openshift.io cluster -o jsonpath='{.spec.domain}')/k10/"

# Display the collected information
echo "Cluster API URL: $CLUSTER_API"
echo "K10 Dashboard URL: $K10_DASHBOARD_URL"

# Create the K10 manifest with the dynamic values
cat <<EOF | oc apply -f -
apiVersion: apik10.kasten.io/v1alpha1
kind: K10
metadata:
  name: k10
  namespace: kasten-io
spec:
  auth:
    openshift:
      enabled: true
      openshiftURL: $CLUSTER_API
      dashboardURL: $K10_DASHBOARD_URL
      insecureCA: true
  route:
    enabled: true
    tls:
      enabled: true
EOF
