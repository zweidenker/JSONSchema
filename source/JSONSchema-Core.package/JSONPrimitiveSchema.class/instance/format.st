accessing
format
	^ format ifNil: [ 
		format := self defaultFormat ]