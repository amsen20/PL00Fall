#lang racket
(provide (all-defined-out))

(define (find x ls)
  (cond
    [(null? ls) #f]
    [(equal? (car x) (car (car ls))) #t]
    [else (find x (cdr ls))]
    ))

(define (merge_envs E1 E2)
  (cond
    [(null? E1) E2]
    [(find (car E1) E2) (merge_envs (cdr E1) E2)]
    [else (cons (car E1) (merge_envs (cdr E1) E2))]
    ))