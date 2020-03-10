writing
writePropertiesOn: mapWriter
	super writePropertiesOn: mapWriter.
	format ifNotNil: [  
		mapWriter writeKey: 'format' value: self formatString ] 
