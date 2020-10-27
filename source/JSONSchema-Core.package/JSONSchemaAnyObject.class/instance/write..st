writing
write: anObject
	^ String streamContents: [ :stream |
		self write: anObject on: (JSONSchemaWriter on: stream)  ]