as yet unclassified
testRefToBooleanSchemaTrue
	"$ref to boolean schema true"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"#/definitions/bool","definitions":{"bool":true}}'.
	"any value is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data