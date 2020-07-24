as yet unclassified
testConstWith1DoesNotMatchTrue
	"const with 1 does not match true"

	| schema data |
	schema := JSONSchema fromString: '{"const":1}'.
	"true is invalid"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"integer one is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"float one is valid"
	data := NeoJSONReader fromString: '1.0'.
	schema validate: data