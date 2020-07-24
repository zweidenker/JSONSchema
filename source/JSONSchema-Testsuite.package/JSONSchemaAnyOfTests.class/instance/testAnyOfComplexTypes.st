as yet unclassified
testAnyOfComplexTypes
	"anyOf complex types"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"anyOf":[{"properties":{"bar":{"type":"integer"}},"required":["bar"]},{"properties":{"foo":{"type":"string"}},"required":["foo"]}]}'.
	"first anyOf valid (complex)"
	data := NeoJSONReader fromString: '{"bar":2}'.
	schema validate: data.
	"second anyOf valid (complex)"
	data := NeoJSONReader fromString: '{"foo":"baz"}'.
	schema validate: data.
	"both anyOf valid (complex)"
	data := NeoJSONReader fromString: '{"foo":"baz","bar":2}'.
	schema validate: data.
	"neither anyOf valid (complex)"
	data := NeoJSONReader fromString: '{"foo":2,"bar":"quux"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError