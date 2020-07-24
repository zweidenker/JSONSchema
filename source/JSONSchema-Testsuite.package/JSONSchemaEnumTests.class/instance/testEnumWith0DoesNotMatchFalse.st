as yet unclassified
testEnumWith0DoesNotMatchFalse
	"enum with 0 does not match false"

	| schema data |
	schema := JSONSchema fromString: '{"enum":[0]}'.
	"false is invalid"
	data := NeoJSONReader fromString: 'false'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"integer zero is valid"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"float zero is valid"
	data := NeoJSONReader fromString: '0.0'.
	schema validate: data