#lang racket
(require "matrix/matrix-utils.rkt")

(define evaluate-diagonals 
    (lambda (m i j rows cols player)
        (cond
        [(> (+ j 2) cols) 
            (evaluate-diagonals m (+ i 1) 0 rows cols player)]
        [(> (+ i 2) rows) 
            #f]
        [(and (= (get m i j) player) (= (get m i j) (get m (+ i 1) (+ j 1))) (= (get m (+ i 2) (+ j 2)) (get m (+ i 1) (+ j 1)))) 
            #t]
        [(and (= (get m (+ i 2) j) player) (= (get m i (+ j 2)) (get m (+ i 1) (+ j 1))) (= (get m (+ i 2) j) (get m (+ i 1) (+ j 1)))) 
            #t]
        [else 
            (evaluate-diagonals m i (+ j 1) rows cols player)]
        )
    )
)

(define evaluate-rows 
    (lambda (m i j rows cols player)
        (cond 
        [(> (+ j 2) cols)
            (evaluate-rows m (+ i 1) 0 rows cols player)]
        [(> i rows) #f]
        [(and (= (get m i j) player) (= (get m i j) (get m i (+ j 1))) (= (get m i (+ j 1)) (get m i (+ j 2)))) 
            #t]
        [else 
            (evaluate-rows m i (+ j 1) rows cols player)]
        )
    )
)

(define evaluate-cols 
    (lambda (m i j rows cols player)
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
    )
)

;;Evaluates if there exists 3 in a row on diagonals, columns or rows. previously it is tested if the cell 
;; of the possible candidate can win, if so, the cell is framed with the player in turn and returns true.
(define evaluate 
    (lambda (m M N player i j defense)
        (and (set m i j player)
        (if (or (evaluate-cols m 0 0 (- M 1) (- N 1) player)
        (evaluate-diagonals m 0 0 (- M 1) (- N 1) player)
        (evaluate-rows m 0 0 (- M 1) (- N 1) player))
            (and (set m i j defense) #t)
            (and (set m i j 0) #f))
        )
    )
)

;;It is in charge of making the next movement of the cpu, if it can win in the current cell, it will 
;;make the movement, if not, it will test if it can at least avoid losing, if not, it will choose 
;;another candidate
(define next-move 
    (lambda (m i j rows cols player oponent pos)
        (cond
        [(> i (- rows 1)) 
            (if (=(car pos) -1)
                "TIE!"
                (set m (car pos) (car (cdr pos)) player))]
        [(> j (- cols 1 )) 
            (next-move m (+ i 1) 0 rows cols player oponent pos)]
        [(and (= (get m i j) 0) (evaluate m rows cols player i j player))
            "LET'S GO!"]
        [(and (= (get m i j) 0) (evaluate m rows cols oponent i j player)) 
            "NOT IN MY HOUSE!"]  
        [else 
            (if(= (get m i j) 0)
                (next-move m i (+ j 1) rows cols player oponent  (list i j))
                (next-move m i (+ j 1) rows cols player oponent pos)
            )]
        )   
    )   
)
(provide (all-defined-out))