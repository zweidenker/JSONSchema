as yet unclassified
testMaxProperties0MeansTheObjectIsEmpty
	"maxProperties = 0 means the object is empty"

	| schema data |
	schema := JSONSchema fromString: '{"maxProperties":0}'.
	"no properties is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"one property is invalid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError