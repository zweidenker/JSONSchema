private
archive
	^ archive
		ifNil:
			[ archive := (FileSystem zip: self archiveFile) open workingDirectory ]