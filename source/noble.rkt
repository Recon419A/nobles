#lang rosette

(require "choice.rkt")

(provide noble make-noble print-noble person-name)

(struct person (name gender age) #:transparent)

(struct noble person (house hobby location) #:transparent)

;; (define (make-noble names genders houses)
;;   (random-instance noble (list names genders houses)))

(define (make-noble names genders houses hobbies locations)
  (noble (choose-random names)
         (choose-random genders)
         (choose-random (range 8 108))
         (choose-random houses)
         (choose-random hobbies)
         (choose-random locations)))

(define (print-noble noble)
  (string-append (person-name noble) " of the " (noble-house noble)))

