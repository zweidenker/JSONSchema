as yet unclassified
testOneOfWithBooleanSchemasAllFalse
	"oneOf with boolean schemas, all false"

	| schema data |
	schema := JSONSchema fromString: '{"oneOf":[false,false,false]}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError