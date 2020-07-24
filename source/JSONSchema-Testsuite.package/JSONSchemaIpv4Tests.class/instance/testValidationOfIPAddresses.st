as yet unclassified
testValidationOfIPAddresses
	"validation of IP addresses"

	| schema data |
	schema := JSONSchema fromString: '{"format":"ipv4"}'.
	"a valid IP address"
	data := NeoJSONReader fromString: '"192.168.0.1"'.
	schema validate: data.
	"an IP address with too many components"
	data := NeoJSONReader fromString: '"127.0.0.0.1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an IP address with out-of-range values"
	data := NeoJSONReader fromString: '"256.256.256.256"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an IP address without 4 components"
	data := NeoJSONReader fromString: '"127.0"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an IP address as an integer"
	data := NeoJSONReader fromString: '"0x7f000001"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an IP address as an integer (decimal)"
	data := NeoJSONReader fromString: '"2130706433"'.
	self should: [ schema validate: data ] raise: JSONSchemaError