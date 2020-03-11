as yet unclassified
write: aCollection
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := JSONSchemaWriter on: stream.
			self write: aCollection on: writer ]