as yet unclassified
testMultipleDependenciesSubschema
	"multiple dependencies subschema"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"dependencies":{"bar":{"properties":{"foo":{"type":"integer"},"bar":{"type":"integer"}}}}}'.
	"valid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	schema validate: data.
	"no dependency"
	data := NeoJSONReader fromString: '{"foo":"quux"}'.
	schema validate: data.
	"wrong type"
	data := NeoJSONReader fromString: '{"foo":"quux","bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"wrong type other"
	data := NeoJSONReader fromString: '{"foo":2,"bar":"quux"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"wrong type both"
	data := NeoJSONReader fromString: '{"foo":"quux","bar":"quux"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError