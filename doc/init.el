(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/")
)

(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(setq package-list '(org ox-epub))

(dolist (p package-list)
  (when (not (package-installed-p p))
    (package-install p)))
