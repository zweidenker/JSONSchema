as yet unclassified
testOneOfWithBooleanSchemasMoreThanOneTrue
	"oneOf with boolean schemas, more than one true"

	| schema data |
	schema := JSONSchema fromString: '{"oneOf":[true,true,false]}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError