accessing
archiveFile
	^ archiveFile ifNil: [ archiveFile := self downloadArchiveFile ]