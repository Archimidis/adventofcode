#lang racket

(require "solution.rkt")

(define claims (map parse-claim
                          (remove* '("")
                                   (string-split (file->string "./input")
                                                 "\n"))))

(define overlapped (overlapped-claims claims))

(println (hash-count overlapped))
(println (find-intact-claim overlapped claims))