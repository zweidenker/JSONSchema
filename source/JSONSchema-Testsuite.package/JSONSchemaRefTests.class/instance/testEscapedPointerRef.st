as yet unclassified
testEscapedPointerRef
	"escaped pointer ref"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"percent%field":{"type":"integer"},"tilde~field":{"type":"integer"},"properties":{"percent":{"$ref":"#/percent%25field"},"slash":{"$ref":"#/slash~1field"},"tilde":{"$ref":"#/tilde~0field"}},"slash/field":{"type":"integer"}}'.
	"slash invalid"
	data := NeoJSONReader fromString: '{"slash":"aoeu"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"tilde invalid"
	data := NeoJSONReader fromString: '{"tilde":"aoeu"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"percent invalid"
	data := NeoJSONReader fromString: '{"percent":"aoeu"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"slash valid"
	data := NeoJSONReader fromString: '{"slash":123}'.
	schema validate: data.
	"tilde valid"
	data := NeoJSONReader fromString: '{"tilde":123}'.
	schema validate: data.
	"percent valid"
	data := NeoJSONReader fromString: '{"percent":123}'.
	schema validate: data