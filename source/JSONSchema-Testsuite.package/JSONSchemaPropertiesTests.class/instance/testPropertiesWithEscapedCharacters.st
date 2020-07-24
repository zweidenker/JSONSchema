as yet unclassified
testPropertiesWithEscapedCharacters
	"properties with escaped characters"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"foo\"bar":{"type":"number"},"foo\\bar":{"type":"number"},"foo\tbar":{"type":"number"},"foo\nbar":{"type":"number"},"foo\rbar":{"type":"number"},"foo\fbar":{"type":"number"}}}'.
	"object with all numbers is valid"
	data := NeoJSONReader
		fromString:
			'{"foo\"bar":1,"foo\\bar":1,"foo\tbar":1,"foo\nbar":1,"foo\rbar":1,"foo\fbar":1}'.
	schema validate: data.
	"object with strings is invalid"
	data := NeoJSONReader
		fromString:
			'{"foo\"bar":"1","foo\\bar":"1","foo\tbar":"1","foo\nbar":"1","foo\rbar":"1","foo\fbar":"1"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError