tests
testWritingURI
	| object string |
	object := 'http://www.sampledomain.org/some/path?and=arguments' asZnUrl .
	string := JSONFormatURI write: object.
	self assert: string equals: 'http://www.sampledomain.org/some/path?and=arguments' 