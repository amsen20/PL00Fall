#lang racket
(provide (all-defined-out))

(define (max a b) (if (<= a b) b a))

(define (upd ans x)
  (cons (+ x (max 0 (car ans)))
        (max (+ x (max 0 (car ans))) (cdr ans))
        ))

(define (eval ls)
  (cond
    [(null? ls) (cons 0 0)]
    [else (upd (eval (cdr ls)) (car ls))]
    ))

(define (get_MSS ls)
  (cdr (eval ls))
  )