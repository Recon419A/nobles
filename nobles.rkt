#lang rosette

(require rosette/lib/angelic)

(define names (file->lines "names.txt"))
(define houses (file->lines "houses.txt"))
(define relationships (file->lines "relationships.txt"))

(struct noble (name house) #:transparent)

(define (make-noble names houses)
  (noble (apply choose* (shuffle names))
         (apply choose* (shuffle houses))))

(define (print-noble noble)
  (string-append (noble-name noble) " of the " (noble-house noble)))

(struct family (parent-1 parent-2 children) #:transparent)

(define (print-family family)
  (list (print-noble (family-parent-1 family))
        (print-noble (family-parent-2 family))
        (map print-noble (family-children family))))

(define (make-nobles names houses p)
  (if (< (random 100) p)
      (cons (make-noble names houses) (make-nobles names houses p))
      empty))

(define (make-family names houses)
  (family (make-noble names houses)
          (make-noble names houses)
          (make-nobles names houses 80)))

(struct relationship (noble-1 description noble-2))

(define (make-relationship noble-1 noble-2)
  (relationship noble-1 (apply choose* (shuffle relationships)) noble-2))

(define (print-relationship relationship)
  (string-append (print-noble (relationship-noble-1 relationship)) " "
                 (relationship-description relationship) " "
                 (print-noble (relationship-noble-2 relationship))))

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

;;(define (pick-one-dammit logical-variable))

(define (test-pick-one)
  (clear-asserts!)
  (define choices '(0 1 2 3 4 5 6 7 8 9))
  (define-symbolic* x integer?)
  (assert (member x (shuffle choices)))
  (evaluate x (solve asserts)))

;; (define (aggregate-test)
;;   (for/list ([i 10])
;;     (for/sum ([j 100])
;;       (if (equal? (test-pick-one) i) 1 0))))

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
