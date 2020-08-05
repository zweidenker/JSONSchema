accessing
schemaString
	^ '{"allOf":[{"$ref":"http://localhost:1234/nested.json#foo"}],"definitions":{"A":{"definitions":{"B":{"$id":"#foo","type":"integer"}},"$id":"nested.json"}},"$id":"http://localhost:1234/root"}'