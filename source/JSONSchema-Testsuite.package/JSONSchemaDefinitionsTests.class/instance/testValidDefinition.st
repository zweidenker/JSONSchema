as yet unclassified
testValidDefinition
	"valid definition"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"http://json-schema.org/draft-07/schema#"}'.
	"valid definition schema"
	data := NeoJSONReader
		fromString: '{"definitions":{"foo":{"type":"integer"}}}'.
	schema validate: data