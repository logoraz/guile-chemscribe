;; ChemScribe is a highly extensible Chemical Formula Builder & Molecular Editor written in Guile
;;
;; Copyright (C) 2024  Erik P Almaraz
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;; GNU Guix development manifest. To start the Guile REPL:
;;
;;   guix shell -m path/to/manifest.scm -- guile
;;
;;   For development,
;;
;;   guix shell -D /path/to/manifest.scm -- guile

(use-modules (guix packages)
             (gnu packages guile)
             (gnu packages guile-xyz)
             (gnu packages sdl))

(packages->manifest
 (list guile-next
       guile-hoot
       guile-websocket
       guile-sdl2
       sdl2
       sdl2-image
       sdl2-ttf
       sdl2-mixer))
