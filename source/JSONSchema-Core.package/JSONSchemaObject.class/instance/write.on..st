writing
write: anObject on: writer
	self checkRequiredKeys: anObject jsonSchemaKeys.
	writer writeMapStreamingDo: [ :streamWriter |
		properties keysAndValuesDo: [ :key :schema | 
			(anObject jsonSchemaKeys includes: key) ifTrue: [  
				streamWriter
					writeKey: key 
					value: (anObject jsonSchemaAt: key)
					as: schema ] ] ]