as yet unclassified
testNotWithBooleanSchemaTrue
	"not with boolean schema true"

	| schema data |
	schema := JSONSchema fromString: '{"not":true}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError