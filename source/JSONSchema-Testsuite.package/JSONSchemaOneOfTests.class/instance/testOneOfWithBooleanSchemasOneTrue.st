as yet unclassified
testOneOfWithBooleanSchemasOneTrue
	"oneOf with boolean schemas, one true"

	| schema data |
	schema := JSONSchema fromString: '{"oneOf":[true,false,false]}'.
	"any value is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data