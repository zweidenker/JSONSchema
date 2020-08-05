private
archiveFile
	^ archiveFile ifNil:
		[ self download ]