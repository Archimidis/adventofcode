#lang racket

(require "solution.rkt")

(module+ test
  (require rackunit rackunit/text-ui)
  
  (define suite
    (test-suite
     "day 2"

     (test-equal? "checksum example 1" (checksum '("abcdef")) 0)
     (test-equal? "checksum example 2" (checksum '("abcdef" "bababc")) 1)
     (test-equal? "checksum example 3" (checksum '("abcdef" "bababc" "abbcde")) 2)
     (test-equal? "checksum example 4"
                  (checksum '("abcdef" "bababc" "abbcde" "abcccd" "aabcdd" "abcdee" "ababab"))
                  12)

     (test-equal? "diff-by-1" (diff-by-1 '("abcde" "fghij" "klmno" "pqrst" "fguij" "axcye" "wvxyz"))
                  '("fghij"  "fguij"))

     (test-equal? "common-letters"
                  (common-letters "fghij"  "fguij")
                  "fgij")))

  (run-tests suite))