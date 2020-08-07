private
downloadArchiveFile
	^ [ :job | 
	job title: 'Downloading JSON Schema Test Suite ...'.
	(FileLocator temp
		/ ('JSON-Schema-Test-Suite-' , UUIDGenerator next asString) , 'zip')
		binaryWriteStreamDo: [ :stream | stream nextPutAll: (ZnEasy get: self class url) contents ];
		yourself ] asJob run