#!/bin/bash
kubectl create configmap syncthing-conf --from-file=config/cert.pem --from-file=config/key.pem --from-file=config/config.xml -o yaml --dry-run > ../10-syncthing-conf.yaml
kubectl create configmap syncthing-script --from-file=script.sh -o yaml --dry-run > ../20-syncthing-script.yaml
kubectl create secret generic oauth2-proxy-secrets --from-literal=cookie-secret=JfBnh-Njot-J5tfdJ9V0sw== --from-literal=client-id=1087886107719-04855ehlnofcku1h0rtuqlsva5p0k2to.apps.googleusercontent.com --from-literal=client-secret=cuOTfvDOOQfpr7strUOJfbCh -o yaml --dry-run > ../50-secret-oauth2-google.yaml
kubectl create configmap mails-ok --from-file=mails-ok.txt -o yaml --dry-run > ../60-configmap-mails-ok.yaml
