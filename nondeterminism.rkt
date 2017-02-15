#lang rosette

(require rosette/lib/angelic)

;;(define (pick-one-dammit logical-variable))

(define (test-pick-one)
  (clear-asserts!)
  (define choices '(0 1 2 3 4 5 6 7 8 9))
  (define-symbolic* x integer?)
  (assert (member x (shuffle choices)))
  (evaluate x (solve asserts)))

(define (agg-test num-trials)
  (define accumulator '(0 0 0 0 0 0 0 0 0 0))
  (run-trials num-trials accumulator))

(define (run-trials num-trials accumulator)
  (if (equal? 0 num-trials) accumulator
      (run-trials (- num-trials 1)
                  (list-update accumulator (test-pick-one)
                               (lambda (count) (+ 1 count))))))

(define (test-choose-one)
  (define x (choose* 1 2 3 4))
  (evaluate x (solve asserts)))

;; (apply choose* choices)
;; (evaluate x (solve asserts))
