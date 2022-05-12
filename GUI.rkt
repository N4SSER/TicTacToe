#lang racket/gui
(require racket/gui/base)
(require "utils/matrix/matrix-utils.rkt")
(require "utils/cpu-moves.rkt")


(define canvas-matrix #f)
(define numeric-matrix #f)
(define numero-filas #f)
(define numero-columnas #f)
(define cpu-symbol 1)
(define player-symbol -1)


; Custom canvas
(define c%
  (class canvas%
    (define fila #f)
    (define columna #f)
    (define symbol "/")

    (define/public (set-fila number)
      (set! fila number)
      "fila set")
    (define/public (get-fila)
      fila)
    
    (define/public (set-columna number)
      (set! columna number)
      "culumna set")

    (define/public (get-columna)
          columna)

    (define/public (set-symbol new-symb)
      (set! symbol new-symb))
    (define/public (get-symbol)
      symbol)
    (define/override on-paint
      (lambda ()
        
        (send (send this get-dc) set-text-foreground "blue")
        (send (send this get-dc) draw-text symbol 0 0)
        )
      )

    (define/override (on-event ev)
      (when (is-a? ev mouse-event%)
        (when (send ev get-left-down)
          (cond 
            (
              (not (equal? symbol "O"))  
              (set-symbol "X") 
              (gui-to-matrix numeric-matrix 0 0 numero-filas numero-columnas canvas-matrix)
              (next-move numeric-matrix 0 0 numero-filas numero-columnas 1 -1 '(-1 -1))
              (matrix-to-gui numeric-matrix canvas-matrix 0 0 numero-filas numero-columnas)
            )
          )
          (send this refresh-now)
          )))
    (super-instantiate ())
  ))

;;main game frame 
(define gameframe (new frame%
                   [label "TicTacToe"]
                   [min-width 500]
                   [min-height 500]
                   [stretchable-width 1920]
                   [stretchable-height 1080]))
"DEFINED GAMEFRAME"

;;Dialog when the user inputs incorrect dimensions for the game setup
(define incorrect-dimension (new dialog%
                                 [label "Incorrect Dimensions"]
                                 [parent gameframe]
                                 [width 500]
                                 [height 100]))
"DEFINED INCORRECT DIMENSION DIALOG"

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
;;list of rows
(define rows (list row1 row2 row3 row4 row5 row6 row7 row8 row9 row10))
"DEFINED ROWS LIST"

;;definition of individual cells
(define cell11 (new c% [parent row1] [style '(deleted)]))
(define cell12 (new c% [parent row1] [style '(deleted)]))
(define cell13 (new c% [parent row1] [style '(deleted)]))
(define cell14 (new c% [parent row1] [style '(deleted)]))
(define cell15 (new c% [parent row1] [style '(deleted)]))
(define cell16 (new c% [parent row1] [style '(deleted)]))
(define cell17 (new c% [parent row1] [style '(deleted)]))
(define cell18 (new c% [parent row1] [style '(deleted)]))
(define cell19 (new c% [parent row1] [style '(deleted)]))
(define cell110 (new c% [parent row1] [style '(deleted)]))

(define cell21 (new c% [parent row2] [style '(deleted)]))
(define cell22 (new c% [parent row2] [style '(deleted)]))
(define cell23 (new c% [parent row2] [style '(deleted)]))
(define cell24 (new c% [parent row2] [style '(deleted)]))
(define cell25 (new c% [parent row2] [style '(deleted)]))
(define cell26 (new c% [parent row2] [style '(deleted)]))
(define cell27 (new c% [parent row2] [style '(deleted)]))
(define cell28 (new c% [parent row2] [style '(deleted)]))
(define cell29 (new c% [parent row2] [style '(deleted)]))
(define cell210 (new c% [parent row2] [style '(deleted)]))

(define cell31 (new c% [parent row3] [style '(deleted)]))
(define cell32 (new c% [parent row3] [style '(deleted)]))
(define cell33 (new c% [parent row3] [style '(deleted)]))
(define cell34 (new c% [parent row3] [style '(deleted)]))
(define cell35 (new c% [parent row3] [style '(deleted)]))
(define cell36 (new c% [parent row3] [style '(deleted)]))
(define cell37 (new c% [parent row3] [style '(deleted)]))
(define cell38 (new c% [parent row3] [style '(deleted)]))
(define cell39 (new c% [parent row3] [style '(deleted)]))
(define cell310 (new c% [parent row3] [style '(deleted)]))

(define cell41 (new c% [parent row4] [style '(deleted)]))
(define cell42 (new c% [parent row4] [style '(deleted)]))
(define cell43 (new c% [parent row4] [style '(deleted)]))
(define cell44 (new c% [parent row4] [style '(deleted)]))
(define cell45 (new c% [parent row4] [style '(deleted)]))
(define cell46 (new c% [parent row4] [style '(deleted)]))
(define cell47 (new c% [parent row4] [style '(deleted)]))
(define cell48 (new c% [parent row4] [style '(deleted)]))
(define cell49 (new c% [parent row4] [style '(deleted)]))
(define cell410 (new c% [parent row4] [style '(deleted)]))

(define cell51 (new c% [parent row5] [style '(deleted)]))
(define cell52 (new c% [parent row5] [style '(deleted)]))
(define cell53 (new c% [parent row5] [style '(deleted)]))
(define cell54 (new c% [parent row5] [style '(deleted)]))
(define cell55 (new c% [parent row5] [style '(deleted)]))
(define cell56 (new c% [parent row5] [style '(deleted)]))
(define cell57 (new c% [parent row5] [style '(deleted)]))
(define cell58 (new c% [parent row5] [style '(deleted)]))
(define cell59 (new c% [parent row5] [style '(deleted)]))
(define cell510 (new c% [parent row5] [style '(deleted)]))

(define cell61 (new c% [parent row6] [style '(deleted)]))
(define cell62 (new c% [parent row6] [style '(deleted)]))
(define cell63 (new c% [parent row6] [style '(deleted)]))
(define cell64 (new c% [parent row6] [style '(deleted)]))
(define cell65 (new c% [parent row6] [style '(deleted)]))
(define cell66 (new c% [parent row6] [style '(deleted)]))
(define cell67 (new c% [parent row6] [style '(deleted)]))
(define cell68 (new c% [parent row6] [style '(deleted)]))
(define cell69 (new c% [parent row6] [style '(deleted)]))
(define cell610 (new c% [parent row6] [style '(deleted)]))

(define cell71 (new c% [parent row7] [style '(deleted)]))
(define cell72 (new c% [parent row7] [style '(deleted)]))
(define cell73 (new c% [parent row7] [style '(deleted)]))
(define cell74 (new c% [parent row7] [style '(deleted)]))
(define cell75 (new c% [parent row7] [style '(deleted)]))
(define cell76 (new c% [parent row7] [style '(deleted)]))
(define cell77 (new c% [parent row7] [style '(deleted)]))
(define cell78 (new c% [parent row7] [style '(deleted)]))
(define cell79 (new c% [parent row7] [style '(deleted)]))
(define cell710 (new c% [parent row7] [style '(deleted)]))

(define cell81 (new c% [parent row8] [style '(deleted)]))
(define cell82 (new c% [parent row8] [style '(deleted)]))
(define cell83 (new c% [parent row8] [style '(deleted)]))
(define cell84 (new c% [parent row8] [style '(deleted)]))
(define cell85 (new c% [parent row8] [style '(deleted)]))
(define cell86 (new c% [parent row8] [style '(deleted)]))
(define cell87 (new c% [parent row8] [style '(deleted)]))
(define cell88 (new c% [parent row8] [style '(deleted)]))
(define cell89 (new c% [parent row8] [style '(deleted)]))
(define cell810 (new c% [parent row8] [style '(deleted)]))

(define cell91 (new c% [parent row9] [style '(deleted)]))
(define cell92 (new c% [parent row9] [style '(deleted)]))
(define cell93 (new c% [parent row9] [style '(deleted)]))
(define cell94 (new c% [parent row9] [style '(deleted)]))
(define cell95 (new c% [parent row9] [style '(deleted)]))
(define cell96 (new c% [parent row9] [style '(deleted)]))
(define cell97 (new c% [parent row9] [style '(deleted)]))
(define cell98 (new c% [parent row9] [style '(deleted)]))
(define cell99 (new c% [parent row9] [style '(deleted)]))
(define cell910 (new c% [parent row9] [style '(deleted)]))

(define cell101 (new c% [parent row10] [style '(deleted)]))
(define cell102 (new c% [parent row10] [style '(deleted)]))
(define cell103 (new c% [parent row10] [style '(deleted)]))
(define cell104 (new c% [parent row10] [style '(deleted)]))
(define cell105 (new c% [parent row10] [style '(deleted)]))
(define cell106 (new c% [parent row10] [style '(deleted)]))
(define cell107 (new c% [parent row10] [style '(deleted)]))
(define cell108 (new c% [parent row10] [style '(deleted)]))
(define cell109 (new c% [parent row10] [style '(deleted)]))
(define cell1010 (new c% [parent row10] [style '(deleted)]))


(define row1cells (list cell11 cell12 cell13 cell14 cell15 cell16 cell17 cell18 cell19 cell110))
(define row2cells (list cell21 cell22 cell23 cell24 cell25 cell26 cell27 cell28 cell29 cell210))
(define row3cells (list cell31 cell32 cell33 cell34 cell35 cell36 cell37 cell38 cell39 cell310))
(define row4cells (list cell41 cell42 cell43 cell44 cell45 cell46 cell47 cell48 cell49 cell410))
(define row5cells (list cell51 cell52 cell53 cell54 cell55 cell56 cell57 cell58 cell59 cell510))
(define row6cells (list cell61 cell62 cell63 cell64 cell65 cell66 cell67 cell68 cell69 cell610))
(define row7cells (list cell71 cell72 cell73 cell74 cell75 cell76 cell77 cell78 cell79 cell710))
(define row8cells (list cell81 cell82 cell83 cell84 cell85 cell86 cell87 cell88 cell89 cell810))
(define row9cells (list cell91 cell92 cell93 cell94 cell95 cell96 cell97 cell98 cell99 cell910))
(define row10cells (list cell101 cell102 cell103 cell104 cell105 cell106 cell107 cell108 cell109 cell1010))


(define cells (list row1cells row2cells row3cells row4cells row5cells row6cells row7cells row8cells row9cells row10cells))
"DEFINED CELLS LIST"
(define (gui-to-matrix-aux matrix i j n curr-row)
  (cond 
    (
      (equal? j n)
      0
    )
    (else
      (define curr-cell (car curr-row))
      (define m-symbol (send curr-cell get-symbol))
      (cond 
        (
          (equal? m-symbol "X")
          (set matrix i j -1)
        )
        (
          (equal? m-symbol "O")
          (set matrix i j 1)
        )
        (else
          (set matrix i j 0)
        )
      )
      (gui-to-matrix-aux matrix i (+ j 1) n (cdr curr-row))
    )
  )

)

(define (gui-to-matrix matrix i j m n canvas-matrix)
  (cond 
    (
      (equal? i m)
      (displayln numeric-matrix)
    )
    (else
      (gui-to-matrix-aux matrix i 0 n (car canvas-matrix))
      (gui-to-matrix matrix (+ i 1) 0 m n (cdr canvas-matrix))
    )
  )
)

(define (matrix-to-gui-aux matrix curr-row i j n)
  (cond 
    (
      (equal? j n)
      0
    )
    (else
      (define curr-cell (car curr-row))
      (define m-symbol (get numeric-matrix i j))
      (cond 
        (
          (equal? m-symbol cpu-symbol)
          (send curr-cell set-symbol "O")
          (send curr-cell refresh-now)
        ) 
        (
          (equal? m-symbol player-symbol)
          (send curr-cell set-symbol "X")
        )
        (else
          (send curr-cell set-symbol "/")
        )
      )
      (matrix-to-gui-aux matrix (cdr curr-row) i (+ j 1) n)
    )))

(define (matrix-to-gui matrix canvas-matrix i j m n)
  (cond
    (
      (equal? i m)
    0
    )
    (else
      (matrix-to-gui-aux matrix (car canvas-matrix) i 0 n)
      (matrix-to-gui matrix (cdr canvas-matrix) (+ i 1) 0 m n)
    )
  )
  )
(define (make-canvas row m n parent)
  (cond 
    ((equal? n 0) 0)
    (else
      (define curr-cell (car row))
      (send parent add-child curr-cell)
      (send curr-cell refresh-now)
      (send curr-cell set-fila (- numero-filas m))
      (send curr-cell set-columna (- numero-columnas n))
      (make-canvas (cdr row) m (- n 1) parent)
    )
  ))
"DEFINED MAKE-CANVAS FUNCTION"

(define (make-board-aux m n panels canvases)
  "Entered make-board-aux"
  (cond 
    ((equal? m 0) 0)
    (else (send gameframe add-child (car panels))
      (make-canvas (car canvases) m n (car panels))
      (make-board-aux (- m 1) n (cdr panels) (cdr canvases))
    )
  )
)

"DEFINED MAKEBOARDAUX FUNCTION"

(define (make-board m n)
  (make-board-aux m n rows cells)
)
"DEFINED MAKEBOARD FUNCTION"

;;function that the user calls to start the game
(define (TTT m n)
  (cond ((< m 3) (send incorrect-dimension show #t))
        ((< n 3) (send incorrect-dimension show #t))
        ((> m 10) (send incorrect-dimension show #t))
        ((> n 10) (send incorrect-dimension show #t))
        (else (set! numero-filas m) (set! numero-columnas n)  (set! canvas-matrix cells) (set! numeric-matrix (make numero-filas numero-columnas)) (displayln numeric-matrix)(make-board m n) (send gameframe show #t))))
"DEFINED TTT FUNCTION"

