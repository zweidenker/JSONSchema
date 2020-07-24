as yet unclassified
testValidationOfTimeStrings
	"validation of time strings"

	| schema data |
	schema := JSONSchema fromString: '{"format":"time"}'.
	"a valid time string"
	data := NeoJSONReader fromString: '"08:30:06.283185Z"'.
	schema validate: data.
	"an invalid time string"
	data := NeoJSONReader fromString: '"08:30:06 PST"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"only RFC3339 not all of ISO 8601 are valid"
	data := NeoJSONReader fromString: '"01:01:01,1111"'.
	self should: [ schema validate: data ] raise: JSONSchemaError