#lang rosette

(require "../source/noble.rkt"
         "test-data.rkt"
         rackunit)

(define genders '("male" "female"))

(define (smoke-unconstrained)
  (clear-asserts!)
  (define noble-1 (make-noble names genders houses))
  (define noble-2 (make-noble names genders houses))
  (list (evaluate noble-1 (solve asserts))
        (evaluate noble-2 (solve asserts))))

(define (smoke-constrain)
  (clear-asserts!)
  (define ian-noble (make-noble names genders houses))
  (assert (equal? (noble-name ian-noble) "Ian"))
  (evaluate ian-noble (solve asserts)))

(define (smoke-prefilled)
  (clear-asserts!)
  (define premade-noble (make-noble '("Ian") '("male") '("Red Rose")))
  (evaluate premade-noble (solve asserts)))

(define (smoke-print)
  (print-noble (smoke-prefilled)))
