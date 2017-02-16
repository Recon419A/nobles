#lang rosette

(require rosette/lib/angelic)
(require rosette/lib/synthax)

(define choices '(0 1 2 3 4 5 6 7 8 9))
;;(define choices '(0))

(struct point (x y))

(define z (apply choose* (shuffle (list 1 2 (gensym)))))

(assert (member z (list 1 2)))

(evaluate z (solve asserts))

;; (define (test-choose)
;;   (define x (apply choose* (shuffle choices)))
;;   (evaluate x (solve asserts)))

;; (struct point (x y))

;; (define (test-synth)
;;   (define x (choose* 1 2 3))
;;   (define y (choose* 1 2 3))
;;   (define my-point (point x y))
;;   (define binding (synthesize #:forall (list x)
;;                               #:guarantee (equal? y 3)))
;;   (print-forms binding))


;; (define (poly x)
;;   (+ (* x x x x) (* 6 x x x) (* 11 x x) (* 6 x)))

;; (define (factored x)
;;   (* (+ x (??)) (+ x 1) (+ x (??)) (+ x (??))))

;; (define (same p f x)
;;   (assert (= (p x) (f x))))

;; (define-symbolic i integer?)

;; (define binding
;;     (synthesize #:forall (list i)
;;                 #:guarantee (same poly factored i)))

;; (print-forms binding)

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
