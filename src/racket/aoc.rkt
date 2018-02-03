#lang racket

(define (zip l1 l2)
  (map list l1 l2))

(define (rotate lst n)
  (drop (append lst (take lst n)) n))

(define (sum-dups capcha distance)
  (let ([fst (lambda (x) (car x))]
        [snd (lambda (x) (car (cdr x)))]
        [capcha (filter (lambda (x) (number? x))
                        (map string->number (string-split capcha "")))])
    (foldl (lambda (x acc) (+ acc (fst x)))
           0
           (filter (lambda (x) (equal? (fst x) (snd x)))
                   (zip capcha (rotate capcha distance))))))

(define (one input)
  (cons (sum-dups input 1) (sum-dups input (quotient (string-length input) 2))))