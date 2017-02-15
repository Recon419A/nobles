#lang rosette

(require "../source/noble.rkt"
         "test-data.rkt"
         rackunit)

(define (smoke-test-make-noble)
  (clear-asserts!)
  (define noble-1 (make-noble names houses))
  (define noble-2 (make-noble names houses))
  (list (evaluate noble-1 (solve asserts))
        (evaluate noble-2 (solve asserts))))

(check-equal? (print-noble (make-noble '("Ian") '("Red Rose")))
              "Ian of the Red Rose"
              "Simple Printing")
