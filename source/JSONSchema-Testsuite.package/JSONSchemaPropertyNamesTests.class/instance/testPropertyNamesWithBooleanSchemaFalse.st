as yet unclassified
testPropertyNamesWithBooleanSchemaFalse
	"propertyNames with boolean schema false"

	| schema data |
	schema := JSONSchema fromString: '{"propertyNames":false}'.
	"object with any properties is invalid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty object is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data