instance creation
readFrom: aStream object: object
	^ self 
		readUsing: (NeoJSONReader on: aStream)
		object: object