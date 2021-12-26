#lang racket

(require "A.rkt")
(require rackunit)

(define tests
  (test-suite
   "Main tests"

   (check-equal? (get_MSS '(1 2 -10 4 5)) 9 "Sample")
   (check-equal? (get_MSS '(1 2 -10 9 2 -1 0)) 11 "Sample")
   (check-equal? (get_MSS '(1 2 3 4 5)) 15 "Easy")
   (check-equal? (get_MSS '(2 3 4 1 1 5 -1 -2 -3 -4 2 3 5 1)) 17 "Medium")
   (check-equal? (get_MSS '(-1 -2 -3 4 5 1 -1 2 -1 -2 -3)) 11 "Medium")
   (check-equal? (get_MSS '(-1 -2 2 -1 2 3 5 -2 10 -1 -2 -3 5)) 19 "Hard")
   (check-equal? (get_MSS '(-1 2 3 10 11 -4 5 -20 1 12 -4 15 6 -9 10 1 -1 -5)) 39 "Hard")

   ))

(require rackunit/text-ui)
(run-tests tests)