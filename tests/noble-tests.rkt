#lang rosette

(require "../source/noble.rkt"
         "test-data.rkt"
         rackunit)

(define (smoke-unconstrained)
  (clear-asserts!)
  (for/list ([i 5])
    (clear-asserts!)
    (evaluate (make-noble names species genders houses hobbies locations) (solve asserts))))

(define (smoke-constrain)
  (clear-asserts!)
  (define ian-noble (make-noble names species genders houses hobbies locations))
  (assert (equal? (person-name ian-noble) "Ian"))
  (evaluate ian-noble (solve asserts)))

(define (smoke-prefilled)
  (clear-asserts!)
  (define premade-noble (make-noble '("Ian") '("human") '("male") '("Red Rose") '("Swimming") '("Swamptown")))
  (evaluate premade-noble (solve asserts)))

(define (smoke-print)
  (print-noble (smoke-prefilled)))

(define (smoke-name-genders)
  (clear-asserts!)
  (for/list ([i 5])
    (clear-asserts!)
    (define random-noble (make-noble names species genders houses hobbies locations))
    (assert (member (person-name random-noble) (assoc)))
    (evaluate (make-noble names species genders houses hobbies locations) (solve asserts))))
