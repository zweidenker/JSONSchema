validation
validate: aString
	(options includes: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid option: valid are: ', ($, join: options) ]