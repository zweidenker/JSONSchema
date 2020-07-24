as yet unclassified
testMinPropertiesValidation
	"minProperties validation"

	| schema data |
	schema := JSONSchema fromString: '{"minProperties":1}'.
	"longer is valid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	schema validate: data.
	"exact length is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"too short is invalid"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores arrays"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '""'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data