#lang racket

(define (fact number divisor factors) 
  (cond
    ((< number 2)
     '())
    ((> divisor (sqrt number))
     (reverse (cons number factors)))
    ((zero? (modulo number divisor))
     (fact (/ number divisor) divisor (cons divisor factors)))
    (else
     (fact number (add1 divisor) factors))))

(define (factorize number)
  (fact number 2 '()))