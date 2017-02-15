#lang racket

(provide names houses)

(define names (file->lines "test-data/names.txt"))
(define houses (file->lines "test-data/houses.txt"))
