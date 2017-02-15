#lang rosette

(require rosette/lib/angelic)

(provide noble make-noble print-noble)

(struct noble (name gender house) #:transparent)

;; (define (make-noble names genders houses)
;;   (random-instance noble (list names genders houses)))

(define (make-noble names genders houses)
  (noble (car (choose* (shuffle names)))
         (car (choose* (shuffle genders)))
         (car (choose* (shuffle houses)))))


(define (print-noble noble)
  (string-append (noble-name noble) " of the " (noble-house noble)))

