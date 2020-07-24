as yet unclassified
testAllOfWithOneEmptySchema
	"allOf with one empty schema"

	| schema data |
	schema := JSONSchema fromString: '{"allOf":[{}]}'.
	"any data is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data