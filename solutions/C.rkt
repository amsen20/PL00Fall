#lang racket
(provide (all-defined-out))

(struct rule (left_nonterminal terminal right_nonterminal) #:transparent)

(define (brute cgr gr s t nonterminal)
  (cond
    [(null? cgr) #f]
    [(and
      (equal? (rule-left_nonterminal (car cgr)) nonterminal)
      (search gr s (string-append-immutable t (rule-terminal (car cgr))) (rule-right_nonterminal (car cgr))))
     #t]
    [else (brute (cdr cgr) gr s t nonterminal)]
    ))

(define (search gr s t nonterminal)
  (cond
    [(equal? s t) #t]
    [(<= (string-length s) (string-length t)) #f]
    [else (brute gr gr s t nonterminal)]
    ))

(define (is_derived gr s)
  (search gr s "" "S"))