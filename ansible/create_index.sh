curl -X PUT "43.204.205.20:9200/test_integration?pretty" -u elastic:minutus
curl -X POST "43.204.205.20:5601/api/data_views/data_view" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'
{
  "data_view": {
     "title": "test_integration",
     "name": "test Jenkins elk integration"
  }
}
' -u elastic:minutus
