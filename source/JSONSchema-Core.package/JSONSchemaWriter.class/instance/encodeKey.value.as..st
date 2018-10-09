private
encodeKey: key value: value as: schema
	self nextPut: key.
	self prettyPrintSpace.
	writeStream nextPut: $:.
	self prettyPrintSpace.
	schema write: value on: self