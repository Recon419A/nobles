#lang rosette

(require "noble.rkt"
         "nondeterminism.rkt")

(provide relationship, make-relationship, print-relationship)

(struct relationship (noble-1 description noble-2))

(define (make-relationship noble-1 noble-2)
  (relationship noble-1 (apply choose* (shuffle relationships)) noble-2))

(define (print-relationship relationship)
  (string-append (print-noble (relationship-noble-1 relationship)) " "
                 (relationship-description relationship) " "
                 (print-noble (relationship-noble-2 relationship))))
