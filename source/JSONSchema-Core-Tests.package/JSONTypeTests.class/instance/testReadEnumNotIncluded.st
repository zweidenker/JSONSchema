tests
testReadEnumNotIncluded
	| schema |
	schema := { #foo -> (JSONSchema enum: { 'one' . 'two' . 'three' }) } asJSONSchema.
	self 
		should: [ schema read: '{ "foo" : "four" }' ]
		raise: JSONConstraintError.
		