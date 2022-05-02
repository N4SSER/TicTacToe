#lang racket/gui

(require racket/gui/base)


;;main game frame 
(define gameframe (new frame%
                   [label "TicTacToe"]
                   [min-width 500]
                   [min-height 500]
                   [stretchable-width 1920]
                   [stretchable-height 1080]))


;;Dialog when the user innputs incorrect dimensions for the game setup
(define incorrect-dimension (new dialog%
                                 [label "Incorrect Dimensions"]
                                 [parent gameframe]
                                 [width 500]
                                 [height 100]))

(new message% [parent incorrect-dimension] [label "The board must be at leat 3x3 and at most 10x10"])
(new button% [parent incorrect-dimension] [label "Ok"] [callback (lambda (button event) (send incorrect-dimension show #f))])


;;definition of rows for the board. Inactive until activated
(define row1 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row2 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row3 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row4 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row5 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row6 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row7 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row8 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row9 (new horizontal-panel% [parent gameframe] [style '(deleted)]))
(define row10 (new horizontal-panel% [parent gameframe] [style '(deleted)]))

(define (make-canvas row n width)
(display 1))

(define (make-board-aux m n tempm width)
  (cond 
    ((zero? tempm)
      (#t)
    )
    ((equal? (- m tempm) 0)
      (send gameframe add-child row1)
      (make-canvas row1 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 1)
      (send gameframe add-child row2)
      (make-canvas row2 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 2)
      (send gameframe add-child row3)
      (make-canvas row3 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 3)
      (send gameframe add-child row4)
      (make-canvas row4 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 4)
      (send gameframe add-child row5)
      (make-canvas row5 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 5)
      (send gameframe add-child row6)
      (make-canvas row6 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 6)
      (send gameframe add-child row7)
      (make-canvas row7 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 7)
      (send gameframe add-child row8)
      (make-canvas row8 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 8)
      (send gameframe add-child row9)
      (make-canvas row9 n width)
      (make-board-aux m n (- tempm 1) width)
    )
    ((equal? (- m tempm) 9)
      (send gameframe add-child row1)
      (make-canvas row1 n width)
      (make-board-aux m n (- tempm 1) width)
    )
  )
)
(define (make-board m n)
  (make-board-aux m n (+ m 1) (truncate (/ 500 n)))
)
    
;;function that the user calls to start the game
(define (TTT m n)
  (cond (
         (< m 3)
         (send incorrect-dimension show #t))
        (
         (< n 3)
         (send incorrect-dimension show #t))
        (
         (> m 10)
         (send incorrect-dimension show #t))
        (
         (> n 10)
         (send incorrect-dimension show #t))
        (else
         (make-board m n)
         (send gameframe show #t))))

