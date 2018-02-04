#lang racket

(define (zip l1 l2)
  (map list l1 l2))

(define (rotate lst n)
  (drop (append lst (take lst n)) n))

(define (sum-dups capcha distance)
  (let ([pair-equal? (lambda (x) (equal? (car x) (car (cdr x))))]
        [capcha (filter non-empty-string? (string-split capcha ""))])
    (foldl (lambda (x acc) (+ acc (string->number (car x)))) 0
           (filter pair-equal? (zip capcha (rotate capcha distance))))))

(define (one input)
  (cons (sum-dups input 1)
        (sum-dups input (quotient (string-length input) 2))))

(define (checksum fn spreadsheet)
  (foldl + 0 (map fn spreadsheet)))

(define (two input)
  (let* ([spreadsheet (map (lambda (x) (map string->number (string-split x))) input)]
         [fn-one (lambda (row) (- (argmax identity row) (argmin identity row)))]
     (cons (checksum fn-one spreadsheet)
           null)))
