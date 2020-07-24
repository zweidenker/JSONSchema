as yet unclassified
testObjectPropertiesValidation
	"object properties validation"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"foo":{"type":"integer"},"bar":{"type":"string"}}}'.
	"both properties present and valid is valid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":"baz"}'.
	schema validate: data.
	"one property invalid is invalid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":{}}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"both properties invalid is invalid"
	data := NeoJSONReader fromString: '{"foo":[],"bar":{}}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"doesn't invalidate other properties"
	data := NeoJSONReader fromString: '{"quux":[]}'.
	schema validate: data.
	"ignores arrays"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data