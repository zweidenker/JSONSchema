as yet unclassified
testMaximumValidation
	"maximum validation"

	| schema data |
	schema := JSONSchema fromString: '{"maximum":3.0}'.
	"below the maximum is valid"
	data := NeoJSONReader fromString: '2.6'.
	schema validate: data.
	"boundary point is valid"
	data := NeoJSONReader fromString: '3.0'.
	schema validate: data.
	"above the maximum is invalid"
	data := NeoJSONReader fromString: '3.5'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-numbers"
	data := NeoJSONReader fromString: '"x"'.
	schema validate: data