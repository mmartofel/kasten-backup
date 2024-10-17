#
# To export block PVC's to S3 we need to annotate underlying StorageClass acordingly
#
# https://docs.kasten.io/latest/usage/protect.html#block-mode-export
#

# oc annotate storageclass ocs-storagecluster-ceph-rbd \
oc annotate storageclass ocs-external-storagecluster-ceph-rbd \
    k10.kasten.io/sc-supports-block-mode-exports=true