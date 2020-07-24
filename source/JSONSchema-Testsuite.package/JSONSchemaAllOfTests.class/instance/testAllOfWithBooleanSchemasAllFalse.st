as yet unclassified
testAllOfWithBooleanSchemasAllFalse
	"allOf with boolean schemas, all false"

	| schema data |
	schema := JSONSchema fromString: '{"allOf":[false,false]}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError