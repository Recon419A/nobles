#lang rosette

(require rosette/lib/angelic)

(define choices '(0 1 2 3 4 5 6 7 8 9))

(define (test-pick-one)
  (clear-asserts!)
  (define-symbolic* x integer?)
  (assert (member x (shuffle choices)))
  (evaluate x (solve asserts)))

(define (test-choose-one)
  (clear-asserts!)
  (define x (apply choose* (shuffle choices)))
  (assert (< -4 x))
  (evaluate x (solve asserts)))

(define (agg-test num-trials pick-function)
  (define accumulator (make-list 10 0))
  (run-trials num-trials accumulator pick-function))

(define (run-trials num-trials accumulator pick-function)
  (if (equal? 0 num-trials) accumulator
      (run-trials (- num-trials 1)
                  (list-update accumulator (pick-function)
                               (lambda (count) (+ 1 count)))
                  pick-function)))

(define names (file->lines "names.txt"))
(define houses (file->lines "houses.txt"))

(struct noble (name house) #:transparent)

;; (define (make-noble names houses)
;;   (define noble-1 (noble (apply choose* (shuffle names))
;;                          (apply choose* (shuffle houses))))
;;   (assert (member (noble-name noble-1) names))
;;   (assert (member (noble-house noble-1) houses))
;;   noble-1)

(define (make-noble names houses)
  (define-symbolic x integer?)
  (random-instance noble (list names houses)))

(define (test-make-noble)
  (clear-asserts!)
  (define noble-1 (make-noble names houses))
  (define noble-2 (make-noble names houses))
  (list (evaluate noble-1 (solve asserts))
        (evaluate noble-2 (solve asserts))))

(define (random-instance struct-name fields-options)
  (let ([field-values (for/list ([field-options fields-options])
                        (let ([chosen-value (choose-random field-options)])
                          (assert (member chosen-value field-options))
                          chosen-value))])
    (apply struct-name field-values)))

(define (choose-random choices)
  (apply choose* (shuffle choices)))
