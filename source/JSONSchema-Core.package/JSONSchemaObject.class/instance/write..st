as yet unclassified
write: anObject
	^ String streamContents: [ :stream |
		self write: anObject on: (JSONSchemaWriter on: stream)  ]