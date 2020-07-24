as yet unclassified
testEnumsInProperties
	"enums in properties"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"foo":{"enum":["foo"]},"bar":{"enum":["bar"]}},"required":["bar"],"type":"object"}'.
	"both properties are valid"
	data := NeoJSONReader fromString: '{"foo":"foo","bar":"bar"}'.
	schema validate: data.
	"wrong foo value"
	data := NeoJSONReader fromString: '{"foo":"foot","bar":"bar"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"wrong bar value"
	data := NeoJSONReader fromString: '{"foo":"foo","bar":"bart"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"missing optional property is valid"
	data := NeoJSONReader fromString: '{"bar":"bar"}'.
	schema validate: data.
	"missing required property is invalid"
	data := NeoJSONReader fromString: '{"foo":"foo"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"missing all properties is invalid"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError