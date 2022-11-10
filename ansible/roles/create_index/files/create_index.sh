#!/bin/sh
#echo $*

curl -X PUT "$4:9200/$1?pretty" -u $2:$3
#curl -X POST "43.204.205.20:5601/api/data_views/data_view" -H "kbn-xsrf: true" -H "Content-Type: application/json" -d "
#{
#  'data_view': {
#     'title': "$*",
#     'name': 'logs for jenkins in elk'
#  }
#}" -u elastic:minutus
curl -X POST "$4:5601/api/data_views/data_view" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'
{
  "data_view": {
     "title": "'$1'",
     "name": "Jenkins logs-using ansible"
  }
}
' -u $2:$3
curl -X POST "$4:5601/api/saved_objects/_import?createNewCopies=true" -H "kbn-xsrf: true" --form file=@./export.ndjson -u $2:$3
