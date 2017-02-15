#lang rosette

(require "../source/family.rkt"
         "test-data.rkt")

(define (smoke-test)
  (define family-1 (make-family names houses))
  (print-family (evaluate family-1 (solve asserts))))
