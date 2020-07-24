as yet unclassified
testOneOfWithEmptySchema
	"oneOf with empty schema"

	| schema data |
	schema := JSONSchema fromString: '{"oneOf":[{"type":"number"},{}]}'.
	"one valid - valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"both valid - invalid"
	data := NeoJSONReader fromString: '123'.
	self should: [ schema validate: data ] raise: JSONSchemaError