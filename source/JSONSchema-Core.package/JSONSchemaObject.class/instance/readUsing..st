private
readUsing: reader
	^ self 
		readUsing: reader
		object: self newInstance 