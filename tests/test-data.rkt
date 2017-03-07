#lang racket

(provide names houses genders hobbies locations)

(struct species-names (species-name male-names female-names androgynous-names))

(species-names "human"
               (file->lines "test-data/names/human/male.txt")
               (file->lines "test-data/names/human/female.txt")
               (file->lines "test-data/names/human/androgynous.txt"))

(define names (file->lines "test-data/names.txt"))
(define genders (file->lines "test-data/genders.txt"))
(define houses (file->lines "test-data/houses.txt"))
(define hobbies (file->lines "test-data/hobbies.txt"))
(define locations (file->lines "test-data/locations.txt"))

(define relationships (file->lines "test-data/relationships.txt"))
