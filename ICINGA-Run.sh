# /bin/sh
podman kube play \
    --configmap ./deploy/ConfigMap-SQL.yml \
    --configmap ./deploy/ConfigMap-SSL.yml \
    --configmap ./deploy/ConfigMap-WEB.yml \
    ./deploy/Icinga2-Pod.yml --replace