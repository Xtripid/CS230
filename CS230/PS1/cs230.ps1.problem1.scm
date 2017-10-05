;;; Go to Language, Choose Language, Other Languages, Swindle, Full Swindle
;;; This may have to be done in cs230-graphics.scm as well
;;; cs230.ps1.scm
;;; Jason Wang jsw50

(require racket/base) ;;This allows the type system to work.
(require (file "cs230-graphics.scm")) ;;Pull in the definitions for the drawing window and stuff. Assumes the file is in the same directory. 

;; Here are the procedures you will modify in the problem set
(define flip-side
  (lambda ((length <real>) (heading <real>) (level <integer>))
    (if (zero? level)
        (drawto heading length)
        (let ((smalllen (sqrt (/ (* (/ length 2) (/ length 2)) 2)))
              (lvl-1 (- level 1)))
          (flip-side smalllen (- heading PI/4) lvl-1)
          (flip-side (* 2 smalllen) (+ heading PI/4) lvl-1)
          (flip-side smalllen (- heading PI/4) lvl-1)))))

(define square-snowflake:1
  (lambda ((length <real>) (level <integer>))
    (flip-side length 0.0 level)
    (flip-side length PI/2 level)
    (flip-side length (* -1 PI) level)
    (flip-side length (* -1 PI/2) level)))



;; Make the graphics window visible, and put the pen somewhere useful
(init-graphics 640 480)
(clear)
(moveto 300 100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
