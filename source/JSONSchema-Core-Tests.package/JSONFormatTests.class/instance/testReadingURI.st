tests
testReadingURI
	| object string |
	string := 'http://www.sampledomain.org/some/path?and=arguments'.
	object := JSONFormatURI read: string.
	self assert: object equals: ('http://www.sampledomain.org/some/path?and=arguments' asZnUrl)