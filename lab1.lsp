;1.	 Представить следующие списки в виде списочных ячеек:
;	'(open close halph)						'((TOOL) (call))
;	'((open1) (close2) (halph3))			'((TOOL1) (call2)) ((sell)))
;	'((one) for all (and(me(for you))))		'(((TOOL) (call)) ((sell)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;2. Используя только функции	car	и	cdr,	написать выражения, возвращающие
;1) второй	2) третий	 3) четвертый элементы заданного списка.
(car (cdr '(1 2 3 4 5)))				; second element
(car (cdr (cdr '(1 2 3 4 5))))			; third element
(car (cdr (cdr (cdr '(1 2 3 4 5)))))	; fourth element

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;3. Что будет в результате вычисления выражений
(caadr '((blue cube) (red pyramid)))
;red:	((red pyramid)) -> (red pyramid) -> red

(cdar '((abc) (def) (ghi)))
;():	(abc nil) -> ()

(cadr '((abc) (def) (ghi)))
;(def):	((def) (ghi)) -> (def)

(caddr '((abc) (def) (ghi)))
;(ghi): ((def) (ghi)) -> ((ghi)) -> (ghi)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;4. Напишите результат вычисления выражений:
	(list 'Fred 'and Wilma)			(cons 'Fred '(and Wilma))
;		WILMA unbound					(FRED AND WILMA)
	(list 'Fred '(and Wilma))		(cons 'Fred '(Wilma))
;		(FRED (AND WILMA))				(FRED WILMA)
	(cons nil nil)					(list nil nil)
;		(NIL)							(NIL NIL)
	(cons T nil)					(list T nil)
;		(T)								(T NIL)
	(cons nil T)					(list nil T)
;		(NIL.T)							(NIL T)
	(list nil)						(cons T (list nil))
;		(NIL)							(T NIL)
	(cons (T) nil)					(list (T) nil)
;		func T undefined				func T undefined
	(list '(one two) '(free temp))	(cons '(one two) '(free temp))
;		((ONE TWO) (FREE TEMP))			((ONE TWO) FREE TEMP)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;5. Написать функции
;(f ar1 ar2 ar3 ar4) -> ((ar1 ar2) (ar3 ar4))
(defun f (ar1 ar2 ar3 ar4)
	(list
		(list ar1 ar2)
		(list ar3 ar4)
	)
)

;или

 (defun f (a1 a2 a3 a4)
	`((,a1 ,a2) (,a3 ,a4))
)

(f 1 2 3 4)

;(f ar1 ar2) ->	((ar1) (ar2))
(defun f (ar1 ar2)
	(list
		(list ar1)
		(list ar2)
	)
) 

;или 

(defun f (a1 a2)
`((,a1) (,a2)))

(f 1 2)

;(f ar1) ->	(((ar1)))
(defun f (ar1)
	(list (list (list ar1)))
)

;или 

(defun f (a1)
`(((,a1)))

(f 1)




