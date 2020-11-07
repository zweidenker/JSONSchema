as yet unclassified
read: aString object: object 
	| reader |
	reader := NeoJSONReader on: aString readStream.
	object addAll: (self readUsing: reader).