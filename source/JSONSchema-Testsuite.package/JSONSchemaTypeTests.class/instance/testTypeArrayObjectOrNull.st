as yet unclassified
testTypeArrayObjectOrNull
	"type: array, object or null"

	| schema data |
	schema := JSONSchema fromString: '{"type":["array","object","null"]}'.
	"array is valid"
	data := NeoJSONReader fromString: '[1,2,3]'.
	schema validate: data.
	"object is valid"
	data := NeoJSONReader fromString: '{"foo":123}'.
	schema validate: data.
	"null is valid"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data.
	"number is invalid"
	data := NeoJSONReader fromString: '123'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"string is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError