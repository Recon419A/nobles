#lang rosette

(require rosette/lib/angelic)
(require rosette/lib/synthax)

;;(define choices '(0 1 2 3 4 5 6 7 8 9))
(define choices '(0))

(define (test-synth)
  (define x (choose* (shuffle choices)))
  (evaluate x (asserts)))

  ;; (define binding
  ;;   (synthesize #:forall (list x)
  ;;               #:guarantee (= x 4)))
  ;; (print-forms binding))


;; (define (test-pick-one)
;;   (clear-asserts!)
;;   (define-symbolic* x integer?)
;;   (assert (member x (shuffle choices)))
;;   (evaluate x (solve asserts)))

;; (define (test-choose-one)
;;   (clear-asserts!)
;;   (define x (apply choose* (shuffle choices)))
;;   (assert (< -4 x))
;;   (evaluate x (solve asserts)))

;; (define (agg-test num-trials pick-function)
;;   (define accumulator (make-list 10 0))
;;   (run-trials num-trials accumulator pick-function))

;; (define (run-trials num-trials accumulator pick-function)
;;   (if (equal? 0 num-trials) accumulator
;;       (run-trials (- num-trials 1)
;;                   (list-update accumulator (pick-function)
;;                                (lambda (count) (+ 1 count)))
;;                   pick-function)))
