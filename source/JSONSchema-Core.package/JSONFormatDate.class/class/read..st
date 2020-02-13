reading
read: aString 
	^ [ Date fromString: aString ]
		on: Error 
		do: [ :error | OAInvalidFormat signal: 'format is not a date for ', aString ]