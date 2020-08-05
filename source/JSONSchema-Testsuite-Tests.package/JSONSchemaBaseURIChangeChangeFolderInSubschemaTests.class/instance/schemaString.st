accessing
schemaString
	^ '{"definitions":{"baz":{"definitions":{"bar":{"items":{"$ref":"folderInteger.json"},"type":"array"}},"$id":"folder/"}},"properties":{"list":{"$ref":"#/definitions/baz/definitions/bar"}},"$id":"http://localhost:1234/scope_change_defs2.json","type":"object"}'