as yet unclassified
testOneOfWithBaseSchema
	"oneOf with base schema"

	| schema data |
	schema := JSONSchema
		fromString: '{"oneOf":[{"minLength":2},{"maxLength":4}],"type":"string"}'.
	"mismatch base schema"
	data := NeoJSONReader fromString: '3'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"one oneOf valid"
	data := NeoJSONReader fromString: '"foobar"'.
	schema validate: data.
	"both oneOf valid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError