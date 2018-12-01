#lang racket

(require "chronal-calibration.rkt")

(define puzzle-input (file->list "./input"))

(println (sum puzzle-input))
(println (find-repeated puzzle-input))

