private
encodeKey: key value: value as: schema
	self nextPut: key.
	self prettyPrintSpace.
	writeStream nextPut: $:.
	self prettyPrintSpace.
	value 
		ifNotNil: [ schema write: value on: self ]
		ifNil: [ self writeNull ]