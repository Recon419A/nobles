#lang rosette

(require "nondeterminism.rkt")

(provide noble make-noble print-noble)

(struct noble (name gender house) #:transparent)

(define (make-noble names genders houses)
  (random-instance noble (list names genders houses)))

(define (print-noble noble)
  (string-append (noble-name noble) " of the " (noble-house noble)))

