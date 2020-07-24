as yet unclassified
testMinItemsValidation
	"minItems validation"

	| schema data |
	schema := JSONSchema fromString: '{"minItems":1}'.
	"longer is valid"
	data := NeoJSONReader fromString: '[1,2]'.
	schema validate: data.
	"exact length is valid"
	data := NeoJSONReader fromString: '[1]'.
	schema validate: data.
	"too short is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-arrays"
	data := NeoJSONReader fromString: '""'.
	schema validate: data