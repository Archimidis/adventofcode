#lang racket

(provide claim parse-claim overlapped-claims find-intact-claim)

(struct claim (id top left width height) #:transparent)

(define (remove-colon str)
  (string-replace str ":" ""))
(define (remove-sharp str)
  (string-replace str "#" ""))
(define (list->claim xs)
  (apply claim xs))

(define (parse-claim str)
  (letrec ([splitted (remove "@" (string-split str))]
           [parsed (map string->number
                        (cons (remove-sharp (first splitted))
                              (append (string-split (remove-colon (second splitted)) ",")
                                      (string-split (third splitted) "x"))))])
    (list->claim parsed)))

(define size 1000)

(define (generate-points a-claim)
  (for*/list ([x (range 0 (claim-width a-claim))]
              [y (range 0 (claim-height a-claim))])
    (list (+ (claim-top a-claim) x)
          (+ (claim-left a-claim) y))))

(define (hash-points pairs)
  (foldl (lambda (p h) (if (hash-has-key? h (car p))
                           (hash-update h (car p) add1)
                           (hash-set h (car p) (cdr p))))
         (hash)
         pairs))

(define (find-overlaps claims)
  (for/hash ([(k v) claims]
             #:when (< 1 v))
    (values k v)))

(define (overlapped-claims xs)
  (find-overlaps (hash-points (map (lambda (point) (cons point 1))
                                   (apply append (map (lambda (x) (generate-points x))
                                                      xs))))))

(define (find-intact-claim overlapped claims)
  (first (filter (lambda (a-claim)
                   (let ([points (generate-points a-claim)])
                     (andmap (lambda (point) (not (hash-has-key? overlapped point)))
                             points)))
                 claims)))