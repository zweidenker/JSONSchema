as yet unclassified
write: anObject on: writer
	self checkRequiredKeys: anObject keys.
	writer writeMapStreamingDo: [ :streamWriter |
		properties keysAndValuesDo: [ :key :schema | 
			(anObject includesKey: key) ifTrue: [  
				streamWriter
					writeKey: key 
					value: (anObject perform: key)
					as: schema ] ] ]