;1. Написать функцию, которая принимает целое число и возвращает первое четное число, не меньшее аргумента.
(defun f (x) 
	(if (oddp x) 
		(+ x 1)
		(x)
	)
)
(f 7)
(f 10)

;2. Написать функцию, которая принимает число и возвращает число того же знака, но с модулем на 1 больше модуля аргумента.
(defun f (x)
	(if (minusp x)
		(- x 1) (+ x 1)
	)
)
(f 5)
(f -3)

;3. Написать функцию, которая принимает два числа и возвращает список из этих чисел, расположенный по возрастанию.
(defun f (x y)
	(if (< x y) (list x y)
			 (list y x)
	)
)
(f 3 4)
(f 6 5)
(f 7 7)

;4. Написать функцию, которая принимает три числа и возвращает T, если первое число расположенно между вторым и третьим.
(defun f (x y z)
	(and (>= x y) (<= x z))
)
(f 1 2 3)
(f 3 2 1)
(f 2 1 3)

;5. Каков результат вычисления следующих выражений:
	(and 'fee 'fie 'foe)			(or nil 'fie 'foe)
;		foe								fie
	(or 'fee 'fie 'foe)				(and nil 'fie 'foe)
;		fee								nil
	(and (equal 'abc 'abc) 'yes)	(or (equal 'abc 'abc) 'yes)
;		YES								T

;6. Написать предикат, который принимает два числа-аргумента и возвращает Т, если первое число не меньше второго.
(defun f (x y)
	(>= x y)
)
(fun 1 2)
(fun 2 2)
(fun 3 2)

;7. Какой из следующих двух вариантов предиката ошибочен и почему:
(defun pred1 (x)
	(and (numberp x) (plusp x))
)
(defun pred2 (x)
	(and (plusp x)(numberp x))
) ; сначала вычисляется предикат plusp, который может вернуть ошибку в случае, если x не будет дейтсвительным числом

;8. Решить задачу 4, используя для ее решения конструкции IF, COND, AND/OR.
(defun fun (x y z)
	(if (>= x y)
		(if (<= x z)
			t
		)
		nil
	)
)

(defun fun (x y z)
	(cond	((>= x y)
				(cond	((<= x z) t))
			)
			(t nil)
	)
)
(fun 1 2 3)
(fun 3 2 1)
(fun 2 1 3)

;9. Переписать функцию how-alike, приведенную в лекции и использующую COND, используя конструкции IF, AND/OR.
(defun how_alike(x y)
	(if	(or (= x y) (equal x y))
		'the_same
		(if	(and (oddp x) (oddp y))
			'both_odd
			(if	(and (evenp x) (evenp y))
				'both_even
				'difference
			)
		)
	)
)
(how_alike 4 4)