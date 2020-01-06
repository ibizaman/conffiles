;;; helpers --- Miscellaneous helper functions
;;; Commentary:
;;; Code:

(defun join-line-ending-with (regex)
  "Joins current line with the next one if it ends with REGEX."
  (interactive "MRegex pattern: ")
  (end-of-line)
  (let ((lastword (thing-at-point 'word)))
    (if (null lastword)
        (join-line 1)
      (when (null (string-match-p regex lastword))
        (join-line 1))
      (forward-line -1))))

(defun join-lines-ending-with (regex)
  "Joins all lines in buffer ending with REGEX."
  (interactive "MRegex pattern: ")
  (goto-char (point-max))
  (while (> (point) (point-min))
    (join-line-ending-with regex)))

(defun shrink-lines-one (begprefix endprefix)
  "Shrink line under point.

It leaves BEGPREFIX characters at the start of the line and ENDPREFIX
characters at the end of the line. Replaces the removed part with
` [...] `."
  (interactive "nHow many characters to keep at the start:\nnHow many characters to keep at the end:")
  (let ((linelength (- (line-end-position) (line-beginning-position)))
        (croplength (+ begprefix endprefix))
        (cropstart (+ (line-beginning-position) begprefix))
        (cropend (- (line-end-position) endprefix 7)))
    (when (< croplength linelength)
      (goto-char (line-beginning-position))
      (delete-region cropstart cropend)
      (forward-char begprefix)
      (insert " [...] "))))

(defun shrink-lines (begprefix endprefix)
  "Shrink all lines in buffer.

It leaves BEGPREFIX characters at the start of the line and ENDPREFIX
characters at the end of the line. Replaces the removed part with
` [...] `."
  (interactive "nHow many characters to keep at the start:\nnHow many characters to keep at the end:")
  (goto-char (point-max))
  (while (> (point) (point-min))
    (shrink-lines-one begprefix endprefix)
    (forward-line -1))
  (shrink-lines-one begprefix endprefix))

(defun mongo-clean-log ()
  "Keep command lines and shrink them."
  (interactive)
  (goto-char (point-min))
  (flush-lines "I ACCESS")
  (goto-char (point-min))
  (flush-lines "I NETWORK")
  (join-lines-ending-with "[0-9]+ms")
  (shrink-lines 500 500))

;;; helpers.el ends here
