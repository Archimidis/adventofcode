#lang racket

(require "solution.rkt")

(define puzzle-input (map symbol->string (file->list "./input")))

(println (checksum puzzle-input))
(println (let ([result (diff-by-1 puzzle-input)])
           (common-letters (car result) (cadr result))))