as yet unclassified
testValidationOfDateTimeStrings
	"validation of date-time strings"

	| schema data |
	schema := JSONSchema fromString: '{"format":"date-time"}'.
	"a valid date-time string"
	data := NeoJSONReader fromString: '"1963-06-19T08:30:06.283185Z"'.
	schema validate: data.
	"a valid date-time string without second fraction"
	data := NeoJSONReader fromString: '"1963-06-19T08:30:06Z"'.
	schema validate: data.
	"a valid date-time string with plus offset"
	data := NeoJSONReader fromString: '"1937-01-01T12:00:27.87+00:20"'.
	schema validate: data.
	"a valid date-time string with minus offset"
	data := NeoJSONReader fromString: '"1990-12-31T15:59:50.123-08:00"'.
	schema validate: data.
	"a invalid day in date-time string"
	data := NeoJSONReader fromString: '"1990-02-31T15:59:60.123-08:00"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid offset in date-time string"
	data := NeoJSONReader fromString: '"1990-12-31T15:59:60-24:00"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid date-time string"
	data := NeoJSONReader fromString: '"06/19/1963 08:30:06 PST"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"case-insensitive T and Z"
	data := NeoJSONReader fromString: '"1963-06-19t08:30:06.283185z"'.
	schema validate: data.
	"only RFC3339 not all of ISO 8601 are valid"
	data := NeoJSONReader fromString: '"2013-350T01:01:01"'.
	self should: [ schema validate: data ] raise: JSONSchemaError