as yet unclassified
testFragmentWithinRemoteRef
	"fragment within remote ref"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"http://localhost:1234/subSchemas.json#/integer"}'.
	"remote fragment valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"remote fragment invalid"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError