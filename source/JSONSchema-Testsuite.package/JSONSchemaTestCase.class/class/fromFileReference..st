instance creation
fromFileReference: aFileReference
	^ (aFileReference readStreamDo: [ :stream | self readFrom: stream ])
		name: aFileReference basenameWithoutExtension;
		yourself