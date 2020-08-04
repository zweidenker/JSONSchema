tests
testReadArrayWithEmptyItems
	| schema value |
	schema := JSONSchema fromString: '{"type": "array"}'.
	self 
		shouldnt: [ value := schema readString: '[ 1, 2, 3 , "foo", { "bar" : "baz" }, 4 ]' ]
		raise: Error.
		
	self assert: value size equals: 6.
	self assert: value first isNumber.
	self assert: value fourth isString.
	self assert: value fifth isDictionary.