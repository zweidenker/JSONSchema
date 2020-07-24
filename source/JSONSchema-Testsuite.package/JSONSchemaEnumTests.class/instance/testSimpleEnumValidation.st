as yet unclassified
testSimpleEnumValidation
	"simple enum validation"

	| schema data |
	schema := JSONSchema fromString: '{"enum":[1,2,3]}'.
	"one of the enum is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"something else is invalid"
	data := NeoJSONReader fromString: '4'.
	self should: [ schema validate: data ] raise: JSONSchemaError