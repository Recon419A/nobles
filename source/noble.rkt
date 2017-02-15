#lang rosette

(require rosette/lib/angelic)

(provide noble make-noble print-noble noble-name)

(struct noble (name gender house) #:transparent)

;; (define (make-noble names genders houses)
;;   (random-instance noble (list names genders houses)))

(define (make-noble names genders houses)
  (noble (apply choose* (shuffle names))
         (apply choose* (shuffle genders))
         (apply choose* (shuffle houses))))


(define (print-noble noble)
  (string-append (noble-name noble) " of the " (noble-house noble)))

