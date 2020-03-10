services
convertString: aString
	^ [ self basicConvertString: aString ]
		on: Error 
		do: [ :error | JSONTypeError signal: error description ]