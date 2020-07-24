as yet unclassified
testAnyOfWithBooleanSchemasSomeTrue
	"anyOf with boolean schemas, some true"

	| schema data |
	schema := JSONSchema fromString: '{"anyOf":[true,false]}'.
	"any value is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data