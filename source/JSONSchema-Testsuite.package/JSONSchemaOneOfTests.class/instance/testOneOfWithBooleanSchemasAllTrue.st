as yet unclassified
testOneOfWithBooleanSchemasAllTrue
	"oneOf with boolean schemas, all true"

	| schema data |
	schema := JSONSchema fromString: '{"oneOf":[true,true,true]}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError