as yet unclassified
testConstValidation
	"const validation"

	| schema data |
	schema := JSONSchema fromString: '{"const":2}'.
	"same value is valid"
	data := NeoJSONReader fromString: '2'.
	schema validate: data.
	"another value is invalid"
	data := NeoJSONReader fromString: '5'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"another type is invalid"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError