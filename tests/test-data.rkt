#lang racket

(provide names houses genders)

(define names (file->lines "test-data/names.txt"))
(define houses (file->lines "test-data/houses.txt"))
(define relationships (file->lines "test-data/relationships.txt"))

(define genders '("male" "female"))
