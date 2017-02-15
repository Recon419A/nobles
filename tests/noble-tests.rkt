#lang rosette

(require "../source/noble.rkt"
         "test-data.rkt"
         rackunit)

(define (smoke-test)
  (clear-asserts!)
  (define noble-1 (make-noble names genders houses))
  (define noble-2 (make-noble names genders houses))
  (list (evaluate noble-1 (solve asserts))
        (evaluate noble-2 (solve asserts))))

(define (smoke-2)
  (clear-asserts!)
  (define ian-noble (make-noble names genders houses))
  (assert (equal? (noble-name ian-noble) "Ian"))
  (evaluate ian-noble (solve asserts)))

;; (check-equal? (print-noble (make-noble '("Ian") '("Male") '("Red Rose")))
;;               "Ian of the Red Rose"
;;               "Simple Printing")
