as yet unclassified
testValidationOfURIs
	"validation of URIs"

	| schema data |
	schema := JSONSchema fromString: '{"format":"uri"}'.
	"a valid URL with anchor tag"
	data := NeoJSONReader fromString: '"http://foo.bar/?baz=qux#quux"'.
	schema validate: data.
	"a valid URL with anchor tag and parantheses"
	data := NeoJSONReader
		fromString: '"http://foo.com/blah_(wikipedia)_blah#cite-1"'.
	schema validate: data.
	"a valid URL with URL-encoded stuff"
	data := NeoJSONReader
		fromString: '"http://foo.bar/?q=Test%20URL-encoded%20stuff"'.
	schema validate: data.
	"a valid puny-coded URL "
	data := NeoJSONReader fromString: '"http://xn--nw2a.xn--j6w193g/"'.
	schema validate: data.
	"a valid URL with many special characters"
	data := NeoJSONReader
		fromString: '"http://-.~_!$&''()*+,;=:%40:80%2f::::::@example.com"'.
	schema validate: data.
	"a valid URL based on IPv4"
	data := NeoJSONReader fromString: '"http://223.255.255.254"'.
	schema validate: data.
	"a valid URL with ftp scheme"
	data := NeoJSONReader
		fromString: '"ftp://ftp.is.co.za/rfc/rfc1808.txt"'.
	schema validate: data.
	"a valid URL for a simple text file"
	data := NeoJSONReader
		fromString: '"http://www.ietf.org/rfc/rfc2396.txt"'.
	schema validate: data.
	"a valid URL "
	data := NeoJSONReader
		fromString: '"ldap://[2001:db8::7]/c=GB?objectClass?one"'.
	schema validate: data.
	"a valid mailto URI"
	data := NeoJSONReader fromString: '"mailto:John.Doe@example.com"'.
	schema validate: data.
	"a valid newsgroup URI"
	data := NeoJSONReader
		fromString: '"news:comp.infosystems.www.servers.unix"'.
	schema validate: data.
	"a valid tel URI"
	data := NeoJSONReader fromString: '"tel:+1-816-555-1212"'.
	schema validate: data.
	"a valid URN"
	data := NeoJSONReader
		fromString: '"urn:oasis:names:specification:docbook:dtd:xml:4.1.2"'.
	schema validate: data.
	"an invalid protocol-relative URI Reference"
	data := NeoJSONReader fromString: '"//foo.bar/?baz=qux#quux"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid relative URI Reference"
	data := NeoJSONReader fromString: '"/abc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid URI"
	data := NeoJSONReader fromString: '"\\\\WINDOWS\\fileshare"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid URI though valid URI reference"
	data := NeoJSONReader fromString: '"abc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid URI with spaces"
	data := NeoJSONReader fromString: '"http:// shouldfail.com"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid URI with spaces and missing scheme"
	data := NeoJSONReader fromString: '":// should fail"'.
	self should: [ schema validate: data ] raise: JSONSchemaError