accessing
instanceClass
	^ instanceClass ifNil: [ 
		self defaultInstanceClass ]