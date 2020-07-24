as yet unclassified
testIfWithBooleanSchemaTrue
	"if with boolean schema true"

	| schema data |
	schema := JSONSchema
		fromString: '{"else":{"const":"else"},"then":{"const":"then"},"if":true}'.
	"boolean schema true in if always chooses the then path (valid)"
	data := NeoJSONReader fromString: '"then"'.
	schema validate: data.
	"boolean schema true in if always chooses the then path (invalid)"
	data := NeoJSONReader fromString: '"else"'.
	self should: [ schema validate: data ] raise: JSONSchemaError