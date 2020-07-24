as yet unclassified
testRequiredWithEscapedCharacters
	"required with escaped characters"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"required":["foo\nbar","foo\"bar","foo\\bar","foo\rbar","foo\tbar","foo\fbar"]}'.
	"object with all properties present is valid"
	data := NeoJSONReader
		fromString:
			'{"foo\"bar":1,"foo\\bar":1,"foo\tbar":1,"foo\nbar":1,"foo\rbar":1,"foo\fbar":1}'.
	schema validate: data.
	"object with some properties missing is invalid"
	data := NeoJSONReader fromString: '{"foo\nbar":"1","foo\"bar":"1"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError