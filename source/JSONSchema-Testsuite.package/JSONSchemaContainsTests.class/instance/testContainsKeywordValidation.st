as yet unclassified
testContainsKeywordValidation
	"contains keyword validation"

	| schema data |
	schema := JSONSchema fromString: '{"contains":{"minimum":5}}'.
	"array with item matching schema (5) is valid"
	data := NeoJSONReader fromString: '[3,4,5]'.
	schema validate: data.
	"array with item matching schema (6) is valid"
	data := NeoJSONReader fromString: '[3,4,6]'.
	schema validate: data.
	"array with two items matching schema (5, 6) is valid"
	data := NeoJSONReader fromString: '[3,4,5,6]'.
	schema validate: data.
	"array without items matching schema is invalid"
	data := NeoJSONReader fromString: '[2,3,4]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty array is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not array is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data