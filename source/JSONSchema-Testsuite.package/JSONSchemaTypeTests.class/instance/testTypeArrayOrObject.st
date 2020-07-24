as yet unclassified
testTypeArrayOrObject
	"type: array or object"

	| schema data |
	schema := JSONSchema fromString: '{"type":["array","object"]}'.
	"array is valid"
	data := NeoJSONReader fromString: '[1,2,3]'.
	schema validate: data.
	"object is valid"
	data := NeoJSONReader fromString: '{"foo":123}'.
	schema validate: data.
	"number is invalid"
	data := NeoJSONReader fromString: '123'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"string is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is invalid"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError