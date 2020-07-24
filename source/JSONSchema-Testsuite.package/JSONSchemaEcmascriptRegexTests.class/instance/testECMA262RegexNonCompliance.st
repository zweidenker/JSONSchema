as yet unclassified
testECMA262RegexNonCompliance
	"ECMA 262 regex non-compliance"

	| schema data |
	schema := JSONSchema fromString: '{"format":"regex"}'.
	"ECMA 262 has no support for \Z anchor from .NET"
	data := NeoJSONReader fromString: '"^\\S(|(.|\\n)*\\S)\\Z"'.
	self should: [ schema validate: data ] raise: JSONSchemaError