as yet unclassified
testNotWithBooleanSchemaFalse
	"not with boolean schema false"

	| schema data |
	schema := JSONSchema fromString: '{"not":false}'.
	"any value is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data