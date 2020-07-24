as yet unclassified
testOneOfWithRequired
	"oneOf with required"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"oneOf":[{"required":["foo","bar"]},{"required":["foo","baz"]}],"type":"object"}'.
	"both invalid - invalid"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"first valid - valid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	schema validate: data.
	"second valid - valid"
	data := NeoJSONReader fromString: '{"foo":1,"baz":3}'.
	schema validate: data.
	"both valid - invalid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2,"baz":3}'.
	self should: [ schema validate: data ] raise: JSONSchemaError