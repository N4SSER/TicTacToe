
#lang racket
(define make
  (lambda (rows columns)
    (do ((m (make-vector rows))
         (i 0 (+ i 1)))
        ((= i rows) m)
        (vector-set! m i (make-vector columns)))
))

(define get (lambda (m i j)
    (vector-ref (vector-ref m i) j)
))

(define set (lambda (m i j x)
    (vector-set! (vector-ref m i) j x)
))
(define full-diagonals? (lambda (k m r c)
    (cond
    [(> (+ k 2) r) 
        (if(> (+ m 2) c)
            -1
            0
        )
    ]
    [else k]
    )
))
;(define evaluate-diagonal1 (lambda (m i j r c)
    ;m
;))
;(define evaluate-diagonal2 (lambda (m i j r c)
    ;m
;))
(define evaluate-rows (lambda (m k row rows cols)
    (cond 
    [(and (> (+ k 2) cols) (> (+ row 1) rows)) 0]
    [(and (> (+ k 2) cols) (<= (+ row 1) rows))
        (evaluate-rows m 0 (+ row 1) rows cols)]
    [(and (= (get m row k) (get m row (+ k 1))) (= (get m row (+ k 1)) (get m row (+ k 2)))) 1]
    [else (evaluate-rows m (+ k 1) row rows cols)]
    )
))
(define evaluate-cols (lambda (m k col cols rows)
    (cond
    [(and (> (+ k 2) rows) (> (+ col 1) cols)) 0]
    [(and (> (+ k 2) rows) (<= (+ col 1) cols))
        (evaluate-cols m 0 (+ col 1) cols rows)]
    [(and (= (get m k col) (get m (+ k 1) col)) (= (get m (+ k 1) col ) (get m (+ k 2)  col))) 1] 
    [else (evaluate-cols m (+ k 1) col cols rows)]
    )
))


