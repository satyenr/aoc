#lang racket

(define (zip l1 l2)
  (map list l1 l2))

(define (rotate lst n)
  (drop (append lst (take lst n)) n))

(define (sum-dups capcha distance)
  (let ([pair-equal? (lambda (x) (equal? (car x) (car (cdr x))))]
        [capcha (filter number? (map string->number (string-split capcha "")))])
    (foldl (lambda (x acc) (+ acc (car x))) 0
           (filter pair-equal? (zip capcha (rotate capcha distance))))))

(define (one input)
  (cons (sum-dups input 1)
        (sum-dups input (quotient (string-length input) 2))))
