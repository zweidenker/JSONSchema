as yet unclassified
readFrom: aStream
	^ self readUsing: (NeoJSONReader on: aStream)