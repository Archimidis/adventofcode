#lang racket

(provide sum find-repeated)

(define (sum xs)
  (apply + xs))

(define (cycle xs)
  (append (cdr xs) (list (car xs))))

(define (find-repeated xs)
  (letrec ([loop (lambda (seen-frequencies last-fr ys)
                   (let ([next-fr (+ last-fr (car ys))])
                     (if (set-member? seen-frequencies next-fr)
                         next-fr
                         (loop
                          (set-add seen-frequencies next-fr)
                          next-fr
                          (cycle ys)))))])
    (loop (set 0) 0 xs)))
