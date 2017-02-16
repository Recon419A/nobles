#lang rosette

(require "../source/nondeterminism.rkt")

(define (smoke-1)
  (clear-asserts!)
  (define x (choose-random '(1)))
  (evaluate x (solve asserts)))

(define (smoke-2)
  (clear-asserts!)
  (define x (choose-random '(1 2)))
  (evaluate x (solve asserts)))

(define (smoke-5)
  (clear-asserts!)
  (define x (choose-random '(1 2 3 4 5)))
  (evaluate x (solve asserts)))
