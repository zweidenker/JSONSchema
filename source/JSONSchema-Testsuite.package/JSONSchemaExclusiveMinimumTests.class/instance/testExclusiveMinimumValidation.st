as yet unclassified
testExclusiveMinimumValidation
	"exclusiveMinimum validation"

	| schema data |
	schema := JSONSchema fromString: '{"exclusiveMinimum":1.1}'.
	"above the exclusiveMinimum is valid"
	data := NeoJSONReader fromString: '1.2'.
	schema validate: data.
	"boundary point is invalid"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"below the exclusiveMinimum is invalid"
	data := NeoJSONReader fromString: '0.6'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-numbers"
	data := NeoJSONReader fromString: '"x"'.
	schema validate: data