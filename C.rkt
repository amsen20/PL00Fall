#lang racket
(provide (all-defined-out))

(struct rule (left_nonterminal terminal right_nonterminal) #:transparent)

(define (is_derived gr s) ;; TODO implement this function
  #t)