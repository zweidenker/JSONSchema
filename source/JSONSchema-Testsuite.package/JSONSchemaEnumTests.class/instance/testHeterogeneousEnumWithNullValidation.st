as yet unclassified
testHeterogeneousEnumWithNullValidation
	"heterogeneous enum-with-null validation"

	| schema data |
	schema := JSONSchema fromString: '{"enum":[6,null]}'.
	"null is valid"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data.
	"number is valid"
	data := NeoJSONReader fromString: '6'.
	schema validate: data.
	"something else is invalid"
	data := NeoJSONReader fromString: '"test"'.
	self should: [ schema validate: data ] raise: JSONSchemaError