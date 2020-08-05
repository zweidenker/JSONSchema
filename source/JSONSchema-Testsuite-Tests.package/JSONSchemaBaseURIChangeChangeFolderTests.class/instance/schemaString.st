accessing
schemaString
	^ '{"definitions":{"baz":{"items":{"$ref":"folderInteger.json"},"$id":"folder/","type":"array"}},"properties":{"list":{"$ref":"#/definitions/baz"}},"$id":"http://localhost:1234/scope_change_defs1.json","type":"object"}'