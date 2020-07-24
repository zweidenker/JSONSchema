as yet unclassified
testAllOfWithBooleanSchemasAllTrue
	"allOf with boolean schemas, all true"

	| schema data |
	schema := JSONSchema fromString: '{"allOf":[true,true]}'.
	"any value is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data