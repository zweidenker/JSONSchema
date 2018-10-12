tests
testReadObjectAdditonalPropertiesSchemaMixed
	| schema |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: JSONSchema number.
	self 
		should: [ schema readString: '{ "foo" : "one", "bar" : 3 , "bogus" : "15"}' ]
		raise: JSONTypeErrror.
