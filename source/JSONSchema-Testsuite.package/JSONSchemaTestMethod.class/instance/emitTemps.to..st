as yet unclassified
emitTemps: temps to: aStream
	aStream nextPutAll: '| '.
	temps
		do: [ :temp | aStream nextPutAll: temp ]
		separatedBy: [ aStream space ].
	aStream
		nextPutAll: ' |';
		cr