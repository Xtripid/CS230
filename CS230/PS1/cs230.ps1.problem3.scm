;;; Go to Language, Choose Language, Other Languages, Swindle, Full Swindle
;;; This may have to be done in cs230-graphics.scm as well
;;; cs230.ps1.scm
;;; Jason Wang jsw50

(require racket/base) ;;This allows the type system to work.
(require (file "cs230-graphics.scm")) ;;Pull in the definitions for the drawing window and stuff. Assumes the file is in the same directory. 

;; Here are the procedures you will modify in the problem set

(define side-inv
  (lambda ((length <real>) (heading <real>) (level <integer>) (inverter <function>))
    (if (zero? level)
        (drawto heading length)
        (let ((len/3 (/ length 3))
              (lvl-1 (- level 1)))
          (side-inv len/3 heading lvl-1 inverter)
          (side-inv len/3 (+ (* -1 (inverter level) PI/3) heading) lvl-1 inverter)
          (side-inv len/3 (+ (* (inverter level) PI/3) heading) lvl-1 inverter)
          (side-inv len/3 heading lvl-1 inverter)))))

(define snowflake-inv
  (lambda ((length <real>) (level <integer>) (side <function>) (inverter <function>))
    (side length 0.0 level inverter)
    (side length (* 2 PI/3) level inverter)
    (side length (- (* 2 PI/3)) level inverter)))


;; Make the graphics window visible, and put the pen somewhere useful
(init-graphics 640 480)
(clear)
(moveto 100 200)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;