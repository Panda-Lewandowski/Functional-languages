;1. Чем принципиально отличаются функции cons, list, append?
;Пусть

(setf lst1 '( a b)) (setf lst2 '( c d))

;Каковы результаты вычисления следующих выражений:

(cons lst1 lst2) ; -> ((A B) C D)
(list lst1 lst2) ; -> ((A B) (C D))
(append lst1 lst2) ; -> (A B C D)

;2. Каковы результаты вычисления следующих выражений:
(reverse ()) ; -> nil

(last ()) ; -> nil

(reverse '(a)) ; -> (a)

(last '(a)) ; -> (a)

(reverse '((a b c))) ; -> (a b c)

(last '((a b c))) ; -> (a b c)

;3. Написать по крайней мере два варианта функции, которая возвращает последний элемент своего списка-аргумента.
(defun get-last1 (lst)
    (car (reverse lst)))

(defun get-last2 (x)
    (if	(equal (cdr x) nil)
        (car x)
        (get-last2 (cdr x))
	)
)

;4. Написать по крайней мере два варианта функции, которая возвращает свой список-аргумент без последнего элемента.
(defun cut2 (x)
    (cons	(car x)
        (if	(> (length (cdr x)) 1)
            (cut2 (cdr x))
            nil
        )
    )
)

;5. 5. Написать простой вариант игры в кости, в котором бросаются две правильные кости.
;Если сумма выпавших очков равна 7 или 11 --- выигрыш, если выпало (1,1) или (6,6) ---
; игрок получает право снова бросить кости, во всех остальных случаях ход переходит ко 
;второму игроку, но запоминается сумма выпавших очков. Если второй игрок не выигрывает абслютно, 
;то выигрывает тот игрок, у которого больше очков. Результат игры и значения выпавших костей выводить 
;на экран с помощью функции print.

(defun roll-dice ()  (list (+ (random 6) 1) (+ (random 6) 1)))

(defun play-sum (res)
    (+ (first res) (second res))
)

(defun is-win (res)
    (or (equal 7 (play-sum res))
        (equal 11 (play-sum res))
    )
)

(defun is-lucky (res)
    (or (equal res '(1 1))
        (equal res '(6 6))
    )
)

(defun play () 
    (setq player1 (roll-dice))
    (format T " First player ~A" player1)
    (if (equal T (is-win player1))
        (print " First player win!")
        (if (equal T (is-lucky player1))
            (play)
            (last 
                (list
                    (setq player2 (roll-dice))
                    (format T " Second player ~A" player2)
                    (if (= (play-sum player1) (play-sum player2))
                        (print "Tie!")
                        (if (> (play-sum player1) (play-sum player2))
                            (print "First player win!")
                            (print "Second player win!")
                        )
                    )
                )
            )
        )
    )
)

; Дополнительно: написать реверс списка с помощью базовых функций

(defun rev (l)
    (cond
        ((null l) '())
        (T (append (rev (cdr l)) (list (car l))))
    )
) 
