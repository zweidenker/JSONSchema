as yet unclassified
testValidationOfIPv6Addresses
	"validation of IPv6 addresses"

	| schema data |
	schema := JSONSchema fromString: '{"format":"ipv6"}'.
	"a valid IPv6 address"
	data := NeoJSONReader fromString: '"::1"'.
	schema validate: data.
	"an IPv6 address with out-of-range values"
	data := NeoJSONReader fromString: '"12345::"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an IPv6 address with too many components"
	data := NeoJSONReader fromString: '"1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an IPv6 address containing illegal characters"
	data := NeoJSONReader fromString: '"::laptop"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"no digits is valid"
	data := NeoJSONReader fromString: '"::"'.
	schema validate: data.
	"leading colons is valid"
	data := NeoJSONReader fromString: '"::42:ff:1"'.
	schema validate: data.
	"trailing colons is valid"
	data := NeoJSONReader fromString: '"d6::"'.
	schema validate: data.
	"missing leading octet is invalid"
	data := NeoJSONReader fromString: '":2:3:4:5:6:7:8"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"missing trailing octet is invalid"
	data := NeoJSONReader fromString: '"1:2:3:4:5:6:7:"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"missing leading octet with omitted octets later"
	data := NeoJSONReader fromString: '":2:3:4::8"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"two sets of double colons is invalid"
	data := NeoJSONReader fromString: '"1::d6::42"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mixed format with the ipv4 section as decimal octets"
	data := NeoJSONReader fromString: '"1::d6:192.168.0.1"'.
	schema validate: data.
	"mixed format with double colons between the sections"
	data := NeoJSONReader fromString: '"1:2::192.168.0.1"'.
	schema validate: data.
	"mixed format with ipv4 section with octet out of range"
	data := NeoJSONReader fromString: '"1::2:192.168.256.1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mixed format with ipv4 section with a hex octet"
	data := NeoJSONReader fromString: '"1::2:192.168.ff.1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"mixed format with leading double colons (ipv4-mapped ipv6 address)"
	data := NeoJSONReader fromString: '"::ffff:192.168.0.1"'.
	schema validate: data.
	"triple colons is invalid"
	data := NeoJSONReader fromString: '"1:2:3:4:5:::8"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"8 octets"
	data := NeoJSONReader fromString: '"1:2:3:4:5:6:7:8"'.
	schema validate: data.
	"insufficient octets without double colons"
	data := NeoJSONReader fromString: '"1:2:3:4:5:6:7"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"no colons is invalid"
	data := NeoJSONReader fromString: '"1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ipv4 is not ipv6"
	data := NeoJSONReader fromString: '"127.0.0.1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ipv4 segment must have 4 octets"
	data := NeoJSONReader fromString: '"1:2:3:4:1.2.3"'.
	self should: [ schema validate: data ] raise: JSONSchemaError