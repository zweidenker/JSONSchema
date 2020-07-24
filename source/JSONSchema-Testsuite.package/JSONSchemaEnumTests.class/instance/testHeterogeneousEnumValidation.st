as yet unclassified
testHeterogeneousEnumValidation
	"heterogeneous enum validation"

	| schema data |
	schema := JSONSchema
		fromString: '{"enum":[6,"foo",[],true,{"foo":12}]}'.
	"one of the enum is valid"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"something else is invalid"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"objects are deep compared"
	data := NeoJSONReader fromString: '{"foo":false}'.
	self should: [ schema validate: data ] raise: JSONSchemaError