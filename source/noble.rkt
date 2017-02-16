#lang rosette

(require "choice.rkt")

(provide noble make-noble print-noble noble-name)

(struct noble (name gender house) #:transparent)

;; (define (make-noble names genders houses)
;;   (random-instance noble (list names genders houses)))

(define (make-noble names genders houses)
  (noble (choose-random names)
         (choose-random genders)
         (choose-random houses)))

(define (print-noble noble)
  (string-append (noble-name noble) " of the " (noble-house noble)))

