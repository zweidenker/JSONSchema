as yet unclassified
testAnyOfWithOneEmptySchema
	"anyOf with one empty schema"

	| schema data |
	schema := JSONSchema fromString: '{"anyOf":[{"type":"number"},{}]}'.
	"string is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"number is valid"
	data := NeoJSONReader fromString: '123'.
	schema validate: data