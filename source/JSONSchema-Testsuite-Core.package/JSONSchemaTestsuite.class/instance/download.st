private
download
	^ [ archiveFile := (FileLocator temp
		/ ('JSON-Schema-Test-Suite-' , UUIDGenerator next asString) , 'zip')
		binaryWriteStreamDo: [ :stream | stream nextPutAll: (ZnEasy get: self class url) contents ];
		yourself ] asJob
		title: 'Downloading JSON Schema Test Suite ...';
		run