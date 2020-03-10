tests
testReadingURI
	| object url |
	url := 'http://www.sampledomain.org/some/path?and=arguments' asZnUrl.
	object := JSONFormatURI read: url.
	self assert: object equals: ('http://www.sampledomain.org/some/path?and=arguments' asZnUrl)