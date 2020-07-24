as yet unclassified
testValidationOfAnInternationalizedEMailAddresses
	"validation of an internationalized e-mail addresses"

	| schema data |
	schema := JSONSchema fromString: '{"format":"idn-email"}'.
	"a valid idn e-mail (example@example.test in Hangul)"
	data := NeoJSONReader fromString: '"실례@실례.테스트"'.
	schema validate: data.
	"an invalid idn e-mail address"
	data := NeoJSONReader fromString: '"2962"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a valid e-mail address"
	data := NeoJSONReader fromString: '"joe.bloggs@example.com"'.
	schema validate: data.
	"an invalid e-mail address"
	data := NeoJSONReader fromString: '"2962"'.
	self should: [ schema validate: data ] raise: JSONSchemaError