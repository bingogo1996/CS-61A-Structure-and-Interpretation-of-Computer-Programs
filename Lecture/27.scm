; Call expressions

(+ 1 2 3 4)
(+)
(*)
(- 12)
(- 20 1 2 3 4 5)
(* 2 (+ 1 (* 2 2 2 2 3 3 7)))
(number? 12)
(integer? 3.3)
(zero? 2)

; Definitions

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (= (square guess) x)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1))

; Sierpinski's Triangle (aka Sierpinski's Gasket).

(speed 0)
(rt 90)
(define (line) (fd 100))
(define (twice fn) (fn) (fn))
(define (repeat k fn)
  ; Repeat fn k times.
  (fn)
  (if (> k 1) (repeat (- k 1) fn)))
(define (tri fn)
  ; Repeat fn 3 times, each followed by a 120 degree turn.
  (repeat 3 (lambda () (fn) (lt 120))))
(define (sier d k)
  ; Draw three legs of Sierpinski's triangle to depth d.
  (tri (lambda ()
         (if (= k 1) (fd d) (leg d k)))))
(define (leg d k)
  ; Draw one leg of Sierpinski's triangle to depth d.
  (sier (/ d 2) (- k 1))
  (penup) (fd d) (pendown))
(sier 200 5)


; List demos

(define s (cons 1 (cons 2 nil)))
(cons 3 s)
(cons (cons 4 (cons 3 nil)) s)
(cons s (cons s nil))

(list? s)
(list? nil)
(list? 4)
(null? nil)
(null? s)

(list 1 2)
(list 1 2 3 4)
(cdr (list 1 2 3 4))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define squares (list 1 4 9 16 25))

(length squares)

; Quotation demos

'(1 2 3)
(quote (1 2 3))
'(1 (2 3) 4)
(car (cdr (car (cdr '(1 (2 3) 4)))))
'(+ 1 2)
(car (quote (+ 1 2)))
(car '(+ 1 2))
(cons '+ (list 1 2))
(eval (cons '+ (list 1 2)))
