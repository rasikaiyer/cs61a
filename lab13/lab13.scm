;; Scheme ;;
(define (compose-all funcs)
  (define (composition x) 
    (if (null? funcs) x 
    	((compose-all (cdr funcs)) ((car funcs) x))))
  composition
)

(define (deep-map fn s)
  (cond ((null? s) nil)
	((list? (car s)) 
		(cons (deep-map fn (car s))
		      (deep-map fn (cdr s))))
	(else (cons (fn (car s)) (deep-map fn (cdr s))))
  )
)
