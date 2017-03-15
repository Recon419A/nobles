#lang rosette

(require rackunit)
(require "../source/assert.rkt")

;; equal! tests
(check-exn exn:fail? (lambda () (equal! 1 2)) "incorrect equality assertion")
(check-not-exn (lambda() (equal! 1 1)) "basic equality assertion")

;; not-equal! tests
(check-exn exn:fail? (lambda () (not-equal! 1 1)) "incorrect inequality assertion")
(check-not-exn (lambda() (not-equal! 1 2)))

;; in! tests
(check-exn exn:fail? (lambda () (in! 1 '(2 3 4))))
(check-not-exn (lambda () (in! 1 '(1 2 3))))

;; not-in! tests
(check-exn exn:fail? (lambda () (not-in! 1 '(1 2 3))))
(check-not-exn (lambda () (not-in! 1 '(2 3 4))))
