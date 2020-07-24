as yet unclassified
testAnyOfWithBaseSchema
	"anyOf with base schema"

	| schema data |
	schema := JSONSchema
		fromString: '{"anyOf":[{"maxLength":2},{"minLength":4}],"type":"string"}'.
	"mismatch base schema"
	data := NeoJSONReader fromString: '3'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"one anyOf valid"
	data := NeoJSONReader fromString: '"foobar"'.
	schema validate: data.
	"both anyOf invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError