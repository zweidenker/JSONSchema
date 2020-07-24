as yet unclassified
testConstWithObject
	"const with object"

	| schema data |
	schema := JSONSchema
		fromString: '{"const":{"foo":"bar","baz":"bax"}}'.
	"same object is valid"
	data := NeoJSONReader fromString: '{"foo":"bar","baz":"bax"}'.
	schema validate: data.
	"same object with different property order is valid"
	data := NeoJSONReader fromString: '{"foo":"bar","baz":"bax"}'.
	schema validate: data.
	"another object is invalid"
	data := NeoJSONReader fromString: '{"foo":"bar"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"another type is invalid"
	data := NeoJSONReader fromString: '[1,2]'.
	self should: [ schema validate: data ] raise: JSONSchemaError