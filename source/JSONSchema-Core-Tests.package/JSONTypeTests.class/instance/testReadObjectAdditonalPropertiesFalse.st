tests
testReadObjectAdditonalPropertiesFalse
	| schema |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: false.
	self 
		should: [ schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeErrror.