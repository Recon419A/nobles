#lang racket

(provide names houses genders hobbies locations)

(define names (file->lines "test-data/names.txt"))
(define genders (file->lines "test-data/genders.txt"))
(define houses (file->lines "test-data/houses.txt"))
(define hobbies (file->lines "test-data/hobbies.txt"))
(define locations (file->lines "test-data/locations.txt"))

(define relationships (file->lines "test-data/relationships.txt"))
