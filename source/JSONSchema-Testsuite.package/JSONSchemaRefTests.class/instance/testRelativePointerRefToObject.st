as yet unclassified
testRelativePointerRefToObject
	"relative pointer ref to object"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"foo":{"type":"integer"},"bar":{"$ref":"#/properties/foo"}}}'.
	"match"
	data := NeoJSONReader fromString: '{"bar":3}'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '{"bar":true}'.
	self should: [ schema validate: data ] raise: JSONSchemaError