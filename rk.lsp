(defun rec-calc (lst st)
	(cond
		((null lst) 0)
		((listp lst)
			(+ (rec-calc (car lst) st) (rec-calc (cdr lst) st))
		)
		(t
		(if (member lst st)
			1
			0
		)
		)
	)	
)

(defun fun-calc (lst st)
	(reduce #'+ (mapcar #'(lambda(x)
		(cond
			((listp x) (fun-calc x st))
			(t
				(if (member x st)
					1
					0	
				)
			)
		)
		)
		lst
		)
	)
)

(defun repl (value pos lst)
	(cond ((null lst) (list value))
		((if (> pos (length lst)) (nconc lst (list value)) 
								   (setf (nth (- pos 1) lst) value)) lst)))
								   
								   
(defun task (lst st k)
	(repl (rec-calc lst st) k lst)
)
		
		
(setq l '(1 2 4))
(setq s '(1 3))
(setq k 4)

(print (task l s k))
(print(repl (fun-calc  l s) k s ))

