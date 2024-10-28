;;; ChemScribe -- A highly extensible Chemical Formula Builder & Molecular Editor written in Guile
;;;
;;; Copyright (C) 2024  Erik P Almaraz <erikalmaraz@fastmail.com>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Affero General Public License as published
;;; by the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Affero General Public License for more details.
;;;
;;; You should have received a copy of the GNU Affero General Public License
;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;; Just playing around with guile-sdl2 here for now...
;;
;; To run code:
;;
;; $ guile -L ~/path/to/guile-chemscribe
;;
;; scheme@(guile-user)> ,use (chemscribe)
;; scheme@(guile-user)> (test 0)
;;

(define-module (chemscribe playground)
  #:use-module (ice-9 optarg)
  #:use-module (ice-9 ftw)
  #:use-module (sdl2)
  #:use-module (sdl2 render)
  #:use-module (sdl2 surface)
  #:use-module (sdl2 video)
  #:use-module (sdl2 ttf)
  #:use-module (sdl2 rect)
  #:export (test))


;;
;; Example Code
;;


(define (resolve-path path base-path)
  (canonicalize-path
   (if (absolute-file-name? path)
       path
       (string-append base-path "/" path))))

(define bmp-file (string-append (resolve-path "chemscribe/assets" (getcwd))
                                "/logoraz-symbol.bmp"))

(define (draw-image ren)
  (let* ((surface (load-bmp bmp-file))
         (texture (surface->texture ren surface)))
    (clear-renderer ren)
    (render-copy ren texture)
    (present-renderer ren)
    (sleep 5)))

(define (test arg)
  "Function to test out sdl2 with Guile."
  (sdl-init)
  (call-with-window (make-window #:title "Chemscribe"
                                 #:size '(200 200))
                    (lambda (window)
                      (call-with-renderer (make-renderer window) draw-image)))
  (sdl-quit))

;;
;; Scratch Code
;;

;;(make-rect '10 '10 '200 '200)
