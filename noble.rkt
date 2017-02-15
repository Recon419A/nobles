(define names (file->lines "names.txt"))
(define houses (file->lines "houses.txt"))

(struct noble (name house) #:transparent)

(define (make-noble names houses)
  (define noble-1 (noble (apply choose* (shuffle names))
                         (apply choose* (shuffle houses))))
  (assert (member (noble-name noble-1) names))
  (assert (member (noble-house noble-1) houses))
  noble-1)
