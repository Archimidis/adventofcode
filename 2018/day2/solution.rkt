#lang racket

(provide checksum diff-by-1 common-letters)

(define (checksum xss)
  (let ([result (map length
                     (group-by identity
                               (flatten (map find-letters xss))))])
    (if (empty? result)
        0
        (* (car result) (cadr result)))))

(define (find-letters xs)
  (set->list (list->set (filter (lambda (n) (and (> n 1) (< n 4)))
                                (map length
                                     (group-by identity
                                               (string->list xs)))))))

(define (zip xs ys)
  (if (or (empty? xs) (empty? ys))
      '()
      (cons (cons (car xs) (car ys))
            (zip (cdr xs) (cdr ys)))))

(define (hamming-distance xs ys)
  (apply +
         (map (lambda (p) (if (equal? (car p) (cdr p)) 0 1))
              (zip xs ys))))

(define (diff-by-1 xss)
  (flatten (filter (lambda (p) (= 1 (hamming-distance (string->list (car p))
                                                      (string->list (cadr p)))))
                   (combinations xss 2))))

(define (common-letters xs ys)
  (list->string (map car
                     (filter (lambda (p) (equal? (car p) (cdr p)))
                             (zip (string->list xs)
                                  (string->list ys))))))
