as yet unclassified
testInvalidDefinition
	"invalid definition"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"http://json-schema.org/draft-07/schema#"}'.
	"invalid definition schema"
	data := NeoJSONReader
		fromString: '{"definitions":{"foo":{"type":1}}}'.
	self should: [ schema validate: data ] raise: JSONSchemaError