as yet unclassified
testRootPointerRef
	"root pointer ref"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"foo":{"$ref":"#"}},"additionalProperties":false}'.
	"match"
	data := NeoJSONReader fromString: '{"foo":false}'.
	schema validate: data.
	"recursive match"
	data := NeoJSONReader fromString: '{"foo":{"foo":false}}'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '{"bar":false}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"recursive mismatch"
	data := NeoJSONReader fromString: '{"foo":{"bar":false}}'.
	self should: [ schema validate: data ] raise: JSONSchemaError