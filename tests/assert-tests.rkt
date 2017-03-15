#lang rosette

(require rackunit)
(require "../source/assert.rkt")

;; Equality Tests
(check-exn exn:fail? (lambda () (equal 1 2)) "incorrect equality assertion")
(check-not-exn (lambda() (equal 1 1)) "basic equality assertion")

;; Inequality Tests
(check-exn exn:fail? (lambda () (not-equal 1 1)) "incorrect inequality assertion")
(check-not-exn (lambda() (not-equal 1 2)))
