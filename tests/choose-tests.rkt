#lang rosette

(require rosette/lib/angelic
         rackunit)

(clear-asserts!)

;;(define choices '(0 1 2 3 4 5 6 7 8 9))

(define choices '(0 1))

(define (smoke choose-from)
  (let ([x (choose* (shuffle choose-from))])
    (evaluate x asserts)))

(struct blah (num gender))

(define (struct-smoke)
  (let ([blurgh (blah (choose* (shuffle choices))
                      (choose* (shuffle genders)))])
    (evaluate blurgh (assert (equal? (blah-num blurgh) 1)))))

(define (print-blah my-blah)
  (list (blah-num my-blah) (blah-gender my-blah)))


(define genders '("male" "female"))
