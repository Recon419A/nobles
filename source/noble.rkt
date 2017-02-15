#lang rosette

(require rosette/lib/angelic
         "nondeterminism.rkt")

(provide noble make-noble print-noble)

(struct noble (name house) #:transparent)

(define (make-noble names houses)
  (define-symbolic x integer?)
  (random-instance noble (list names houses)))

(define (print-noble noble)
  (string-append (noble-name noble) " of the " (noble-house noble)))

