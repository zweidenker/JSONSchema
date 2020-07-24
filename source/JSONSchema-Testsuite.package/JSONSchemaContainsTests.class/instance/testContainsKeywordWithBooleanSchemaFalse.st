as yet unclassified
testContainsKeywordWithBooleanSchemaFalse
	"contains keyword with boolean schema false"

	| schema data |
	schema := JSONSchema fromString: '{"contains":false}'.
	"any non-empty array is invalid"
	data := NeoJSONReader fromString: '["foo"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty array is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"non-arrays are valid"
	data := NeoJSONReader
		fromString: '"contains does not apply to strings"'.
	schema validate: data