as yet unclassified
testExclusiveMaximumValidation
	"exclusiveMaximum validation"

	| schema data |
	schema := JSONSchema fromString: '{"exclusiveMaximum":3.0}'.
	"below the exclusiveMaximum is valid"
	data := NeoJSONReader fromString: '2.2'.
	schema validate: data.
	"boundary point is invalid"
	data := NeoJSONReader fromString: '3.0'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"above the exclusiveMaximum is invalid"
	data := NeoJSONReader fromString: '3.5'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-numbers"
	data := NeoJSONReader fromString: '"x"'.
	schema validate: data