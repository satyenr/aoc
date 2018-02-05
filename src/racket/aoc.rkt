#lang racket

(define (zip l1 l2)
  (map list l1 l2))

(define (rotate lst n)
  (drop (append lst (take lst n)) n))

(define (sum-dups capcha distance)
  (let ([pair-equal? (λ (x) (equal? (car x) (cadr x)))]
        [capcha (filter non-empty-string? (string-split capcha ""))])
    (foldl (λ (x acc) (+ acc (string->number (car x)))) 0
           (filter pair-equal? (zip capcha (rotate capcha distance))))))

(define (one input)
  (cons (sum-dups input 1)
        (sum-dups input (quotient (string-length input) 2))))

(define (checksum fn spreadsheet)
  (foldl + 0 (map fn spreadsheet)))

(define (two input)
  (let ([spreadsheet (map (λ (x) (map string->number (string-split x))) input)]
        [fn-one (λ (row) (- (argmax identity row) (argmin identity row)))]
        [fn-two (λ (row) (letrec ([pairs (λ (r) (if (null? r)
                                                    null
                                                    (append (map (λ (x) (cons (car r) x))
                                                                 (cdr r)) (pairs (cdr r)))))]
                                  [divisible (λ (x) (= (remainder (cdr x) (car x)) 0))]
                                  [divisible-pair (car (filter divisible (pairs (sort row <))))])
                           (quotient (cdr divisible-pair) (car divisible-pair))))])
    (cons (checksum fn-one spreadsheet)
          (checksum fn-two spreadsheet))))
