as yet unclassified
testAllOfWithBooleanSchemasSomeFalse
	"allOf with boolean schemas, some false"

	| schema data |
	schema := JSONSchema fromString: '{"allOf":[true,false]}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError