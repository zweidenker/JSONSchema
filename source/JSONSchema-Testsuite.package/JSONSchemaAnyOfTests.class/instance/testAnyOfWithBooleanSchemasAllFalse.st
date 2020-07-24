as yet unclassified
testAnyOfWithBooleanSchemasAllFalse
	"anyOf with boolean schemas, all false"

	| schema data |
	schema := JSONSchema fromString: '{"anyOf":[false,false]}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError