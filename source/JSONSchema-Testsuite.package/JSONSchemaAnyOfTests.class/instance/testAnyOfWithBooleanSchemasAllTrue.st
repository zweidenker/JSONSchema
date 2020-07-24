as yet unclassified
testAnyOfWithBooleanSchemasAllTrue
	"anyOf with boolean schemas, all true"

	| schema data |
	schema := JSONSchema fromString: '{"anyOf":[true,true]}'.
	"any value is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data