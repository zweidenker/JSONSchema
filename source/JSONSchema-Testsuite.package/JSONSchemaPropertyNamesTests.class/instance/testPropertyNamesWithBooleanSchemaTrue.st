as yet unclassified
testPropertyNamesWithBooleanSchemaTrue
	"propertyNames with boolean schema true"

	| schema data |
	schema := JSONSchema fromString: '{"propertyNames":true}'.
	"object with any properties is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"empty object is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data