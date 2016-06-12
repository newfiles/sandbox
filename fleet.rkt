;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fleet) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define rainbow
  (list "red" "orange" "yellow" "green" "blue" "purple"))

(define (soucoupe taille couleur)
  (let* ([bord (/ taille 8)]
         [largeur-chapeau (- taille (* 2 bord))]
         [base (ellipse taille (/ taille 6) "solid" "gray")]
         [chapeau (crop 0 0 largeur-chapeau (/ taille 4)
                        (ellipse largeur-chapeau taille "solid" couleur))])
    (overlay/align/offset "middle" "bottom" chapeau 0 (/ taille 12) base)))

(define (add1mult100 n) (* 100 (+ n 1)))

(define (fleet n couleur)
  (apply above
         (map
          (lambda (taille) (soucoupe taille couleur))
          (build-list n add1mult100))))

(apply beside (map (lambda (couleur) (fleet 5 couleur)) rainbow))