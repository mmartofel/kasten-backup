#!/bin/bash

DEFAULT_STORAGE_CLASS=$(oc get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}')

#
# To export block PVC's to S3 we need to annotate underlying StorageClass acordingly
#   
# https://docs.kasten.io/latest/usage/protect.html#block-mode-export
#

# oc annotate storageclass ocs-storagecluster-ceph-rbd \
oc annotate storageclass $DEFAULT_STORAGE_CLASS \
    k10.kasten.io/sc-supports-block-mode-exports=true