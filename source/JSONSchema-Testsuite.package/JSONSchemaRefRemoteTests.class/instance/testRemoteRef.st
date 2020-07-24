as yet unclassified
testRemoteRef
	"remote ref"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"http://localhost:1234/integer.json"}'.
	"remote ref valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"remote ref invalid"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError