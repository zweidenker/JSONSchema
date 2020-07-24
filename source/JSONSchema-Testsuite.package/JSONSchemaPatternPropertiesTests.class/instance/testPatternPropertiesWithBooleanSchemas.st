as yet unclassified
testPatternPropertiesWithBooleanSchemas
	"patternProperties with boolean schemas"

	| schema data |
	schema := JSONSchema
		fromString: '{"patternProperties":{"f.*":true,"b.*":false}}'.
	"object with property matching schema true is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"object with property matching schema false is invalid"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"object with both properties is invalid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"object with a property matching both true and false is invalid"
	data := NeoJSONReader fromString: '{"foobar":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty object is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data