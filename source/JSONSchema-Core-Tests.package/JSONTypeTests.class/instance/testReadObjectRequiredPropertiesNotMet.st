tests
testReadObjectRequiredPropertiesNotMet
	| schema |
	schema := { 
		#foo -> #string.
		#bar -> #string } asJSONSchema.
	schema required: #(foo bar).

	self 
		should: [ schema readString: '{ "bar" : "two" }' ]
		raise: JSONTypeErrror.
		
	self 
		should: [ schema write: { #bar -> #two } asDictionary ]
		raise: JSONTypeErrror		