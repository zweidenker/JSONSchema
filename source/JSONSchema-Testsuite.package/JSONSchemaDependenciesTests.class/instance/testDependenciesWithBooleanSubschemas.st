as yet unclassified
testDependenciesWithBooleanSubschemas
	"dependencies with boolean subschemas"

	| schema data |
	schema := JSONSchema
		fromString: '{"dependencies":{"foo":true,"bar":false}}'.
	"object with property having schema true is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"object with property having schema false is invalid"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"object with both properties is invalid"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty object is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data