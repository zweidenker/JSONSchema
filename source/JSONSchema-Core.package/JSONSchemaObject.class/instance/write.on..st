as yet unclassified
write: anObject on: writer
	writer writeMapStreamingDo: [ :streamWriter |
		properties keysAndValuesDo: [ :key :schema | 
			streamWriter
				writeKey: key 
				value: (anObject perform: key)
				as: schema  ] ]