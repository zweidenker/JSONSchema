as yet unclassified
testMaxPropertiesValidation
	"maxProperties validation"

	| schema data |
	schema := JSONSchema fromString: '{"maxProperties":2}'.
	"shorter is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"exact length is valid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	schema validate: data.
	"too long is invalid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2,"baz":3}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores arrays"
	data := NeoJSONReader fromString: '[1,2,3]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '"foobar"'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data