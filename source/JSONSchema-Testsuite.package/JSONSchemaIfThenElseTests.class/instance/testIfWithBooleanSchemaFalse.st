as yet unclassified
testIfWithBooleanSchemaFalse
	"if with boolean schema false"

	| schema data |
	schema := JSONSchema
		fromString: '{"else":{"const":"else"},"then":{"const":"then"},"if":false}'.
	"boolean schema false in if always chooses the else path (invalid)"
	data := NeoJSONReader fromString: '"then"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"boolean schema false in if always chooses the else path (valid)"
	data := NeoJSONReader fromString: '"else"'.
	schema validate: data