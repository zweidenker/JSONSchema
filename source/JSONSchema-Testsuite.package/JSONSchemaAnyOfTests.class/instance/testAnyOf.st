as yet unclassified
testAnyOf
	"anyOf"

	| schema data |
	schema := JSONSchema
		fromString: '{"anyOf":[{"type":"integer"},{"minimum":2}]}'.
	"first anyOf valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"second anyOf valid"
	data := NeoJSONReader fromString: '2.5'.
	schema validate: data.
	"both anyOf valid"
	data := NeoJSONReader fromString: '3'.
	schema validate: data.
	"neither anyOf valid"
	data := NeoJSONReader fromString: '1.5'.
	self should: [ schema validate: data ] raise: JSONSchemaError