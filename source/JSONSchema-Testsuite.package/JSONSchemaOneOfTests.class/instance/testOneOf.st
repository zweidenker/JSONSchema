as yet unclassified
testOneOf
	"oneOf"

	| schema data |
	schema := JSONSchema
		fromString: '{"oneOf":[{"type":"integer"},{"minimum":2}]}'.
	"first oneOf valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"second oneOf valid"
	data := NeoJSONReader fromString: '2.5'.
	schema validate: data.
	"both oneOf valid"
	data := NeoJSONReader fromString: '3'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"neither oneOf valid"
	data := NeoJSONReader fromString: '1.5'.
	self should: [ schema validate: data ] raise: JSONSchemaError