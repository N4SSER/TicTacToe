#lang racket
(define make
  (lambda (rows columns)
    (do ((m (make-vector rows))
         (i 0 (+ i 1)))
        ((= i rows) m)
        (vector-set! m i (make-vector columns)))
))

(define get 
  (lambda (m i j)
    (vector-ref (vector-ref m i) j)
  )
)

(define set
  (lambda (m i j x)
    (vector-set! (vector-ref m i) j x)  
  ) 
)
(provide (all-defined-out))