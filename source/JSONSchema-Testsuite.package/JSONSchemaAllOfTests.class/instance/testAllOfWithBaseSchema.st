as yet unclassified
testAllOfWithBaseSchema
	"allOf with base schema"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"properties":{"foo":{"type":"string"}},"required":["foo"]},{"properties":{"baz":{"type":"null"}},"required":["baz"]}],"properties":{"bar":{"type":"integer"}},"required":["bar"]}'.
	"valid"
	data := NeoJSONReader fromString: '{"foo":"quux","bar":2,"baz":null}'.
	schema validate: data.
	"mismatch base schema"
	data := NeoJSONReader fromString: '{"foo":"quux","baz":null}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mismatch first allOf"
	data := NeoJSONReader fromString: '{"bar":2,"baz":null}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mismatch second allOf"
	data := NeoJSONReader fromString: '{"foo":"quux","bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mismatch both"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError