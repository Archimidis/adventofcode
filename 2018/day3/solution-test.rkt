#lang racket

(require "solution.rkt")

(module+ test
  (require rackunit rackunit/text-ui)
  
  (define suite
    (test-suite
     "day 3"

     (test-equal? "parse-claim example 1"
                  (parse-claim "#1 @ 1,3: 4x4")
                  (claim 1 1 3 4 4))
     (test-equal? "parse-claim example 2"
                  (parse-claim "#2 @ 3,1: 4x4")
                  (claim 2 3 1 4 4))
     (test-equal? "parse-claim example 2"
                  (parse-claim "#3 @ 5,5: 2x2")
                  (claim 3 5 5 2 2))
     
     (test-equal? "overlapped-claims example 1"
                  (hash-count (overlapped-claims (list (parse-claim "#1 @ 1,3: 4x4"))))
                  0)
     (test-equal? "overlapped-claims example 2"
                  (hash-count (overlapped-claims (list (parse-claim "#1 @ 1,3: 4x4")
                                                       (parse-claim "#3 @ 5,5: 2x2"))))
                  0)
     (test-equal? "overlapped-claims example 3"
                  (hash-count (overlapped-claims (list (parse-claim "#1 @ 1,3: 4x4")
                                                       (parse-claim "#2 @ 3,1: 4x4")
                                                       (parse-claim "#3 @ 5,5: 2x2"))))
                  4)

     (test-equal? "find-intact-claim"
                  (find-intact-claim
                   (overlapped-claims (list (parse-claim "#1 @ 1,3: 4x4")
                                            (parse-claim "#2 @ 3,1: 4x4")
                                            (parse-claim "#3 @ 5,5: 2x2")))
                   (map parse-claim '("#1 @ 1,3: 4x4" "#2 @ 3,1: 4x4" "#3 @ 5,5: 2x2")))
                  (claim 3 5 5 2 2))
     ))
  
  (run-tests suite))