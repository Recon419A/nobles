#lang rosette

(require "noble.rkt"
         "nondeterminism.rkt")

(provide family make-family print-family)

(struct family (father mother children) #:transparent)

(define (make-family names houses)
  (random-instance family (list (list (make-noble names houses))
                                (list (make-noble names houses))
                                (list (make-nobles names houses 80)))))

(define (print-family family)
  (list (list "Father:" (print-noble (family-father family)))
        (list "Mother:" (print-noble (family-mother family)))
        (list "Children:" (map print-noble (family-children family)))))

(define (make-nobles names houses p)
  (if (< (random 100) p)
      (cons (make-noble names houses) (make-nobles names houses p))
      empty))
