tests
testReadEnumNotIncluded
	| schema |
	schema := { #foo -> (JSONSchema enum: { 'one' . 'two' . 'three' }) } asJSONSchema.
	self 
		should: [ schema readString: '{ "foo" : "four" }' ]
		raise: JSONConstraintError.
		