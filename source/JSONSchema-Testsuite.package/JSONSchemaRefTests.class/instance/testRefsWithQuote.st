as yet unclassified
testRefsWithQuote
	"refs with quote"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"foo\"bar":{"type":"number"}},"properties":{"foo\"bar":{"$ref":"#/definitions/foo%22bar"}}}'.
	"object with numbers is valid"
	data := NeoJSONReader fromString: '{"foo\"bar":1}'.
	schema validate: data.
	"object with strings is invalid"
	data := NeoJSONReader fromString: '{"foo\"bar":"1"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError