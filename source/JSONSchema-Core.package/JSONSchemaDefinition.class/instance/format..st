converstion
format: value
	"If a format is specified convert the value. Otherwise leave it untouched"
	^ format 
		ifNotNil: [ format read: value ]
		ifNil: [ value ]