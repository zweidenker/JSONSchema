as yet unclassified
testPropertiesWithBooleanSchema
	"properties with boolean schema"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"foo":true,"bar":false}}'.
	"no property present is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"only 'true' property present is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"only 'false' property present is invalid"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"both properties present is invalid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError