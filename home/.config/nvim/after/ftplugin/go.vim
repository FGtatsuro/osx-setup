if exists('b:did_ftplugin_after_golang')
    finish
endif
let b:did_ftplugin_after_golang=1

set errorformat=%E!go\ vet\ ./...,
	\%E!go\ build\ %*[^\ ],
	\%-G#\ %*[^\ ],
	\vet:\ %f:%l:%c:\ %m,%f:%l:%c:\ %m,
	\%-Gmake:\ \*\*\*\ \[%*[^\ ]\]\ Error\ %*[^\ ]
