#lang racket
(require "matrix/matrix-utils.rkt")

(define evaluate-diagonals (lambda (m i j rows cols player)
    (cond
    [(> (+ j 2) cols) 
        (evaluate-diagonals m (+ i 1) 0 rows cols player)]
    [ (> (+ i 2) rows) 
        #f]
    [(and (= (get m i j) player) (= (get m i j) (get m (+ i 1) (+ j 1))) (= (get m (+ i 2) (+ j 2)) (get m (+ i 1) (+ j 1)))) 
        #t]
    [(and (= (get m (+ i 2) j) player) (= (get m i (+ j 2)) (get m (+ i 1) (+ j 1))) (= (get m (+ i 2) j) (get m (+ i 1) (+ j 1)))) 
        #t]
    [else 
        (evaluate-diagonals m i (+ j 1) rows cols player)]
    )
))

(define evaluate-rows (lambda (m i j rows cols player)
    (cond 
    [(> (+ j 2) cols)
        (evaluate-rows m (+ i 1) 0 rows cols player)]
    [(> i rows) #f]
    [(and (= (get m i j) player) (= (get m i j) (get m i (+ j 1))) (= (get m i (+ j 1)) (get m i (+ j 2)))) 
        #t]
    [else 
        (evaluate-rows m i (+ j 1) rows cols player)]
    )
))

(define evaluate-cols (lambda (m i j rows cols player)
    (cond
    [(> (+ i 2) rows) 
        #f]
    [( > j cols)
        (evaluate-cols m (+ i 1) 0 rows cols player)]
    [(and (= (get m i j) player) (= (get m i j) (get m (+ i 1) j)) (= (get m (+ i 1) j ) (get m (+ i 2)  j)))
        #t] 
    [else
        (evaluate-cols m i (+ j 1) rows cols player)]
    )
))

(define (evaluate m M N player i j defense)
    (and (set m i j player)
    (if (or (evaluate-cols m 0 0 (- M 1) (- N 1) player)
    (evaluate-diagonals m 0 0 (- M 1) (- N 1) player)
    (evaluate-rows m 0 0 (- M 1) (- N 1) player))
        (and (set m i j defense) #t)
        (and (set m i j 0) #f)
    ))
)
(define (cpu-win m i j rows cols player)
    (cond
    [(> i (- rows 1)) #f]
    [(> j (- cols 1 )) (cpu-win m (+ i 1) 0 rows cols player)]
    [(and (= (get m i j) 0) (evaluate m rows cols player i j player)) #t]
    [else (cpu-win m i (+ j 1) rows cols player)]
    )
)  
(define (f-move m i j rows cols player)
    (cond
    [(> i (- rows 1)) "TIE!"]
    [(> j (- cols 1 )) (f-move m (+ i 1) 0 rows cols player)]
    [(= (get m i j) 0) (set m i j player)  ]
    [else (f-move m i (+ j 1) rows cols player)]
    )
)
(define (next-move m i j rows cols player oponent)
    (cond
    [(> i (- rows 1)) (f-move m 0 0 rows cols player)]
    [(> j (- cols 1 )) (next-move m (+ i 1) 0 rows cols player oponent)]
    [(cpu-win m 0 0 rows cols player) "LET'S GO!"]
    [(and (= (get m i j) 0) (evaluate m rows cols oponent i j player)) "NOT IN MY HOUSE!"]  
    [else (next-move m i (+ j 1) rows cols player oponent)]
    )
)
(provide (all-defined-out))


