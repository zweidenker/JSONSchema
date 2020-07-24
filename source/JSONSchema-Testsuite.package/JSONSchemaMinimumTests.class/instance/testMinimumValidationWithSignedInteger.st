as yet unclassified
testMinimumValidationWithSignedInteger
	"minimum validation with signed integer"

	| schema data |
	schema := JSONSchema fromString: '{"minimum":-2}'.
	"negative above the minimum is valid"
	data := NeoJSONReader fromString: '-1'.
	schema validate: data.
	"positive above the minimum is valid"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"boundary point is valid"
	data := NeoJSONReader fromString: '-2'.
	schema validate: data.
	"boundary point with float is valid"
	data := NeoJSONReader fromString: '-2.0'.
	schema validate: data.
	"float below the minimum is invalid"
	data := NeoJSONReader fromString: '-2.0001'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"int below the minimum is invalid"
	data := NeoJSONReader fromString: '-3'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-numbers"
	data := NeoJSONReader fromString: '"x"'.
	schema validate: data