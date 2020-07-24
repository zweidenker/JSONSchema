as yet unclassified
testValidationOfDateStrings
	"validation of date strings"

	| schema data |
	schema := JSONSchema fromString: '{"format":"date"}'.
	"a valid date string"
	data := NeoJSONReader fromString: '"1963-06-19"'.
	schema validate: data.
	"an invalid date-time string"
	data := NeoJSONReader fromString: '"06/19/1963"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"only RFC3339 not all of ISO 8601 are valid"
	data := NeoJSONReader fromString: '"2013-350"'.
	self should: [ schema validate: data ] raise: JSONSchemaError