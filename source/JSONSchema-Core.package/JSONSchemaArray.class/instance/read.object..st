as yet unclassified
read: aString object: object 
	| reader |
	reader := NeoJSONReader on: aString readStream.
	reader parseListDo: [
		object add: (items readUsing: reader) ].