(defun mult-table (end &key heading decoration start)
  (when (or (zerop end) (and start (> start end)))
    (error "Bad input ('end' == 0 or 'start' > 'end')!"))
  (let* ((st (or start 1))
         (numbers (loop for x from st to end
                        collect (loop for y from st to end
                                      collect (* x y))))
         (max (car (sort
                    (mapcar #'(lambda (x) (apply #'max x)) numbers)
                    #'>)))
         (width (+ 2 (floor (log max 10))))
         (elements (1+ (- end st)))
         (deco-width (1+ (* elements width)))
         (deco (when decoration
                 (make-string deco-width :initial-element #\*)))
         (fstring (format nil "~@[~a~]~~&~~{~~{~~~ad~~}~~%~~}~@[~a~]~~%"
                          deco width deco)))
    (when heading (format t "~a~%" heading))
    (format t fstring numbers)))
