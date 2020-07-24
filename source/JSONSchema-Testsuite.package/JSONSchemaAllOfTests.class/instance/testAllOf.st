as yet unclassified
testAllOf
	"allOf"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"properties":{"bar":{"type":"integer"}},"required":["bar"]},{"properties":{"foo":{"type":"string"}},"required":["foo"]}]}'.
	"allOf"
	data := NeoJSONReader fromString: '{"foo":"baz","bar":2}'.
	schema validate: data.
	"mismatch second"
	data := NeoJSONReader fromString: '{"foo":"baz"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mismatch first"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"wrong type"
	data := NeoJSONReader fromString: '{"foo":"baz","bar":"quux"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError