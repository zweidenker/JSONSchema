as yet unclassified
testAllOfWithTheFirstEmptySchema
	"allOf with the first empty schema"

	| schema data |
	schema := JSONSchema fromString: '{"allOf":[{},{"type":"number"}]}'.
	"number is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"string is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError