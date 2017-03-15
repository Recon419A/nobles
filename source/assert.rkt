#lang rosette

(provide equal! not-equal! in! not-in!)

(define-syntax (p stx)
  (datum->syntax stx (reverse (cdr (syntax->datum stx)))))

(define-syntax (equal! stx)
  (let* ([stx-list (syntax->datum stx)]
         [symbol (cadr stx-list)]
         [value (caddr stx-list)])
    (datum->syntax stx `(assert (equal? ,symbol ,value )))))

(define-syntax (not-equal! stx)
  (let* ([stx-list (syntax->datum stx)]
         [symbol (cadr stx-list)]
         [value (caddr stx-list)])
    (datum->syntax stx `(assert (not (equal? ,symbol ,value ))))))

(define-syntax (in! stx)
  (let* ([stx-list (syntax->datum stx)]
         [symbol (cadr stx-list)]
         [possible-values (caddr stx-list)])
    (datum->syntax stx `(assert (member ,symbol (shuffle ,possible-values ))))))

(define-syntax (not-in! stx)
  (let* ([stx-list (syntax->datum stx)]
         [symbol (cadr stx-list)]
         [possible-values (caddr stx-list)])
    (datum->syntax stx `(assert (not (member ,symbol (shuffle ,possible-values )))))))
