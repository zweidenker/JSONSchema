accessing
schemaString
	^ '{"definitions":{"a":{"type":"integer"},"b":{"$ref":"#/definitions/a"},"c":{"$ref":"#/definitions/b"}},"$ref":"#/definitions/c"}'