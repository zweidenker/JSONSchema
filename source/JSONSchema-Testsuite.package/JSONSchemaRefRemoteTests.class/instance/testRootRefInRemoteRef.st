as yet unclassified
testRootRefInRemoteRef
	"root ref in remote ref"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"name":{"$ref":"name.json#/definitions/orNull"}},"$id":"http://localhost:1234/object","type":"object"}'.
	"string is valid"
	data := NeoJSONReader fromString: '{"name":"foo"}'.
	schema validate: data.
	"null is valid"
	data := NeoJSONReader fromString: '{"name":null}'.
	schema validate: data.
	"object is invalid"
	data := NeoJSONReader fromString: '{"name":{"name":null}}'.
	self should: [ schema validate: data ] raise: JSONSchemaError