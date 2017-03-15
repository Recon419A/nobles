#lang rosette

(provide equal! not-equal!)

(define-syntax (p stx)
  (datum->syntax stx (reverse (cdr (syntax->datum stx)))))

(define-syntax (not-equal! stx)
  (let* ([stx-list (syntax->datum stx)]
         [symbol (cadr stx-list)]
         [value (caddr stx-list)])
    (datum->syntax stx `(assert (not (equal? ,symbol ,value ))))))

(define-syntax (equal! stx)
  (let* ([stx-list (syntax->datum stx)]
         [symbol (cadr stx-list)]
         [value (caddr stx-list)])
    (datum->syntax stx `(assert (equal? ,symbol ,value )))))
