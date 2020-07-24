as yet unclassified
testNestedRefs
	"nested refs"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"a":{"type":"integer"},"b":{"$ref":"#/definitions/a"},"c":{"$ref":"#/definitions/b"}},"$ref":"#/definitions/c"}'.
	"nested ref valid"
	data := NeoJSONReader fromString: '5'.
	schema validate: data.
	"nested ref invalid"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError