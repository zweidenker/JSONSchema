as yet unclassified
testContainsKeywordWithBooleanSchemaTrue
	"contains keyword with boolean schema true"

	| schema data |
	schema := JSONSchema fromString: '{"contains":true}'.
	"any non-empty array is valid"
	data := NeoJSONReader fromString: '["foo"]'.
	schema validate: data.
	"empty array is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError