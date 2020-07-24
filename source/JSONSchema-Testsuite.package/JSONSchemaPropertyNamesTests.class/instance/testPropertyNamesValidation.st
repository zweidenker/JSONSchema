as yet unclassified
testPropertyNamesValidation
	"propertyNames validation"

	| schema data |
	schema := JSONSchema fromString: '{"propertyNames":{"maxLength":3}}'.
	"all property names valid"
	data := NeoJSONReader fromString: '{"f":{},"foo":{}}'.
	schema validate: data.
	"some property names invalid"
	data := NeoJSONReader fromString: '{"foobar":{},"foo":{}}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"object without properties is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"ignores arrays"
	data := NeoJSONReader fromString: '[1,2,3,4]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '"foobar"'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data