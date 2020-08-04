services
validate: aUrl
	(aUrl isKindOf: ZnUrl) ifFalse: [ 
		JSONTypeError
			signal: aUrl printString , ' is not a URL' ]
	