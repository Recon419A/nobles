#lang rosette

(require rosette/lib/angelic
         "noble.rkt")

(define (make-scenario)
  (clear-asserts!)
  (define family (make-family names houses))
  (define relationship-1 (make-relationship (family-parent-1 family)
                                            (family-parent-2 family)))
  (assert (equal? "loves" (relationship-description relationship-1)))
  (let ([sol (solve asserts)])
    (display (print-family (evaluate family sol)))))

(define (make-love-triangle)
  (define noble (make-noble))
  (define lover-1 (make-noble))
  (define lover-2 (make-noble))
  (define relationship-1 (make-relationship lover-1 noble))
  (define relationship-2 (make-relationship lover-2 noble))
  (assert (equal? (relationship-description relationship-1) "loves"))
  (assert (equal? (relationship-description relationship-2) "loves"))
  (list relationship-1 relationship-2))
