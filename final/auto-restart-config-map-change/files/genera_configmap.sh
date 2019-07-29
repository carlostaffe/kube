#!/bin/bash
kubectl create configmap prueba --from-file=genera_configmap.sh --dry-run -oyaml > 10-config-map.yaml
