instance creation
readFrom: aStream
	^ self readUsing: (NeoJSONReader on: aStream)