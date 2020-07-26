private
emitSetUpMethod: aStream
	aStream
		nextPutAll: 'setUp';
		cr;
		nextPutAll: 'schema := self schema';
		cr