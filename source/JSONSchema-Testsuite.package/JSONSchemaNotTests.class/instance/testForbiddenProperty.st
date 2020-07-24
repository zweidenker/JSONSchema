as yet unclassified
testForbiddenProperty
	"forbidden property"

	| schema data |
	schema := JSONSchema fromString: '{"properties":{"foo":{"not":{}}}}'.
	"property present"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"property absent"
	data := NeoJSONReader fromString: '{"bar":1,"baz":2}'.
	schema validate: data