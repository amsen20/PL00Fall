#lang racket

(require "C.rkt")
(require rackunit)

(define grA (list (rule "S" "s" "A") (rule "A" "a" "A") (rule "A" "b" "A")))
(define grB (list (rule "S" "a" "B") (rule "B" "b" "S")))
(define grC (list (rule "S" "a" "B") (rule "B" "b" "S") (rule "S" "c" "C") (rule "C" "c" "C")))

(define tests
  (test-suite
   "Main tests"

   (check-equal? (is_derived grA "sabb") #t "Sample")
   (check-equal? (is_derived grA "abb") #f "Sample")
   (check-equal? (is_derived grB "aba") #t "Easy")
   (check-equal? (is_derived grB "abaa") #f "Easy")
   (check-equal? (is_derived grB "ababa") #t "Medium")
   (check-equal? (is_derived grB "abababaa") #f "Medium")
   (check-equal? (is_derived grC "abababc") #t "Hard")
   (check-equal? (is_derived grC "abababccc") #t "Hard")
   (check-equal? (is_derived grC "abababcca") #f "Hard")
   (check-equal? (is_derived grC "abababcac") #f "Hard")

   ))

(require rackunit/text-ui)
(run-tests tests)