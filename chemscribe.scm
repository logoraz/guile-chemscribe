;; ChemScribe is a highly extensible Chemical Formula Builder & Molecular Editor written in Guile
;;
;; Copyright (C) 2024  Erik P Almaraz
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as published
;; by the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;; Just playing around with guile-sdl2 here for now...
(define-module (chemscribe)
  #:use-module (sdl2)
  #:use-module (sdl2 render)
  #:use-module (sdl2 surface)
  #:use-module (sdl2 video))

(define (draw ren)
  (let* ((surface (load-bmp "chemscribe/assets/logoraz-symbol.bmp"))
         (texture (surface->texture ren surface)))
    (clear-renderer ren)
    (render-copy ren texture)
    (present-renderer ren)
    (sleep 5)))

(sdl-init)

(call-with-window (make-window)
                  (lambda (window)
                    (call-with-renderer (make-renderer window) draw)))

(sdl-quit)
