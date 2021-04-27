
(setq old-elements (list 'examplecol1 'examplecol2))

(setq new-elements (list 'examplecol1 'examplecol3))

(setq test (make-hash-table))
(setq old (make-hash-table))
(setq new (make-hash-table))

; Reference functions for working with hashtable in elisp
(defun add-to-set (element set)
  (puthash element t set))
(defun in-set-p (element set)
  (gethash element set nil))
(defun remove-from-set (element set)
  (remhash element set))


(defun add-element (hm element)
  "adds element to the respective hash-map with a default value of true"
  (puthash element t hm))

; Test that my function works
(-map (-partial #'add-element test) `(1 2 3)); adds 1 2 and 3 to test with value t
(ht-items test); view items

; Add elements (column names) to old and new hash-tables
(-map (-partial #'add-element old) old-elements)
(-map (-partial #'add-element new) new-elements)

; Remove intersections, I guess I didn't need the hashtable, cool dash.el function!
(-difference old-elements new-elements)

(-difference new-elements old-elements)


