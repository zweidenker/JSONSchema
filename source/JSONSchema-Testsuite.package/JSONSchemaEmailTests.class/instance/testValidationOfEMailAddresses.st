as yet unclassified
testValidationOfEMailAddresses
	"validation of e-mail addresses"

	| schema data |
	schema := JSONSchema fromString: '{"format":"email"}'.
	"a valid e-mail address"
	data := NeoJSONReader fromString: '"joe.bloggs@example.com"'.
	schema validate: data.
	"an invalid e-mail address"
	data := NeoJSONReader fromString: '"2962"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"tilde in local part is valid"
	data := NeoJSONReader fromString: '"te~st@example.com"'.
	schema validate: data.
	"tilde before local part is valid"
	data := NeoJSONReader fromString: '"~test@example.com"'.
	schema validate: data.
	"tilde after local part is valid"
	data := NeoJSONReader fromString: '"test~@example.com"'.
	schema validate: data.
	"dot before local part is not valid"
	data := NeoJSONReader fromString: '".test@example.com"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"dot after local part is not valid"
	data := NeoJSONReader fromString: '"test.@example.com"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"two separated dots inside local part are valid"
	data := NeoJSONReader fromString: '"te.s.t@example.com"'.
	schema validate: data.
	"two subsequent dots inside local part are not valid"
	data := NeoJSONReader fromString: '"te..st@example.com"'.
	self should: [ schema validate: data ] raise: JSONSchemaError