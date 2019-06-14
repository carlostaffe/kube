kubectl create secret generic db-secret --from-literal=db-root-pass=secret --from-literal=db-name=kanboard --from-literal=db-user=kb --from-literal=db-password=kb-secret --from-literal=url=mysql://kb:kb-secret@db/kanboard  -o yaml --dry-run > db-secret.txt


kubectl run --image=kanboard/kanboard:v1.2.9 kabo --port=80 --env="DATABASE_URL=mysql://kb:kb-secret@db/kanboard" --dry-run -oyaml > kabo.deploy-plantilla.txt

kubectl create configmap db-sql --from-file=schema.sql -o yaml --dry-run > db-schema.txt
