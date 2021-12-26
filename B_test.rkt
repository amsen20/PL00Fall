#lang racket

(require "B.rkt")
(require rackunit)

(define (check_in x ls)
  (cond
    [(null? ls) #f]
    [(equal? (car ls) x) #t]
    [else (check_in x (cdr ls))]
    ))

(define (is_subset A B)
  (cond
    [(null? A) #t]
    [(check_in (car A) B) (is_subset (cdr A) B)]
    [else #f]
    ))

(define (unordered_eq A B)
  (and (is_subset A B) (is_subset B A)))

(define tests
  (test-suite
   "Main tests"

   (check-equal? (unordered_eq
                  (merge_envs '(("A" . 2) ("B" . 3)) '(("B" . 1) ("C" . 4)))
                  '(("B" . 1) ("A" . 2) ("C" . 4))
                  ) #t "Sample")
   (check-equal? (unordered_eq
                  (merge_envs '(("X" . 2) ("Y" . 3)) '(("X" . 1) ("Y" . 4)))
                  '(("X" . 1) ("Y" . 4))
                  ) #t "Medium")
   (check-equal? (unordered_eq
                  (merge_envs '(("X" . 2) ("Y" . 3)) '(("X" . 1) ("Z" . 4)))
                  '(("X" . 1) ("Y" . 3) ("Z" . 4))
                  ) #t "Medium")
   (check-equal? (unordered_eq
                  (merge_envs '(("X" . 2) ("Y" . 3) ("Z" . 5)) '(("X" . 1) ("Z" . 4) ("W" . 2)))
                  '(("X" . 1) ("Z" . 4) ("Y" . 3) ("W" . 2))
                  ) #t "Hard")

   ))

(require rackunit/text-ui)
(run-tests tests)