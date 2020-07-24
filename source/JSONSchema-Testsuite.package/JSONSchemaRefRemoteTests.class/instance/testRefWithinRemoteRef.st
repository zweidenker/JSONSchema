as yet unclassified
testRefWithinRemoteRef
	"ref within remote ref"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"http://localhost:1234/subSchemas.json#/refToInteger"}'.
	"ref within ref valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"ref within ref invalid"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError