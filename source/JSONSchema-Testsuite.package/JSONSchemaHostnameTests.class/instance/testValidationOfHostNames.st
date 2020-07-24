as yet unclassified
testValidationOfHostNames
	"validation of host names"

	| schema data |
	schema := JSONSchema fromString: '{"format":"hostname"}'.
	"a valid host name"
	data := NeoJSONReader fromString: '"www.example.com"'.
	schema validate: data.
	"a valid punycoded IDN hostname"
	data := NeoJSONReader fromString: '"xn--4gbwdl.xn--wgbh1c"'.
	schema validate: data.
	"a host name starting with an illegal character"
	data := NeoJSONReader fromString: '"-a-host-name-that-starts-with--"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a host name containing illegal characters"
	data := NeoJSONReader fromString: '"not_a_valid_host_name"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a host name with a component too long"
	data := NeoJSONReader
		fromString:
			'"a-vvvvvvvvvvvvvvvveeeeeeeeeeeeeeeerrrrrrrrrrrrrrrryyyyyyyyyyyyyyyy-long-host-name-component"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"starts with hyphen"
	data := NeoJSONReader fromString: '"-hostname"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ends with hyphen"
	data := NeoJSONReader fromString: '"hostname-"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"starts with underscore"
	data := NeoJSONReader fromString: '"_hostname"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ends with underscore"
	data := NeoJSONReader fromString: '"hostname_"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"contains underscore"
	data := NeoJSONReader fromString: '"host_name"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"maximum label length"
	data := NeoJSONReader
		fromString:
			'"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijk.com"'.
	schema validate: data.
	"exceeds maximum label length"
	data := NeoJSONReader
		fromString:
			'"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkl.com"'.
	self should: [ schema validate: data ] raise: JSONSchemaError