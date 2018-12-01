#lang racket

(require "chronal-calibration.rkt")

(module+ test
  (require rackunit rackunit/text-ui)
  
  (define suite
    (test-suite
     "day 1"

     (test-equal? "sum example 1" (sum '(1 -2 3 1)) 3)
     (test-equal? "sum example 2" (sum '(1 1 1)) 3)
     (test-equal? "sum example 3" (sum '(1 1 -2)) 0)
     (test-equal? "sum example 4" (sum '(-1 -2 -3)) -6)

     (test-equal? "find-repeated example 1" (find-repeated '(1 -2 3 1)) 2)
     (test-equal? "find-repeated example 2" (find-repeated '(1 -1)) 0)
     (test-equal? "find-repeated example 3" (find-repeated '(3 3 4 -2 -4)) 10)
     (test-equal? "find-repeated example 4" (find-repeated '(-6 3 8 5 -6)) 5)
     (test-equal? "find-repeated example 5" (find-repeated '(7 7 -2 -7 -4)) 14)
     )
    )

  (run-tests suite))