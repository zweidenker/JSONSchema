as yet unclassified
readString: aString
	^ self read: (NeoJSONReader fromString: aString)