as yet unclassified
testOneOfComplexTypes
	"oneOf complex types"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"oneOf":[{"properties":{"bar":{"type":"integer"}},"required":["bar"]},{"properties":{"foo":{"type":"string"}},"required":["foo"]}]}'.
	"first oneOf valid (complex)"
	data := NeoJSONReader fromString: '{"bar":2}'.
	schema validate: data.
	"second oneOf valid (complex)"
	data := NeoJSONReader fromString: '{"foo":"baz"}'.
	schema validate: data.
	"both oneOf valid (complex)"
	data := NeoJSONReader fromString: '{"foo":"baz","bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"neither oneOf valid (complex)"
	data := NeoJSONReader fromString: '{"foo":2,"bar":"quux"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError