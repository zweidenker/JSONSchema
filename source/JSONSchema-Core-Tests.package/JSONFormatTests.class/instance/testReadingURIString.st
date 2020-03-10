tests
testReadingURIString
	| object string |
	string := 'http://www.sampledomain.org/some/path?and=arguments'.
	object := JSONFormatURI readString: string.
	self assert: object equals: ('http://www.sampledomain.org/some/path?and=arguments' asZnUrl)