oc --namespace kasten-io create secret generic oauth-proxy-secret \
    --from-literal=session-secret=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c43)
