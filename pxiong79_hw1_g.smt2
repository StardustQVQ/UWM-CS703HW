; File: pxiong79_hw1_g.smt2
; Graph G (K(2,2))

; Declare Boolean variables for each vertex and color
(declare-const p00 Bool) ; vertex 0, color 0
(declare-const p01 Bool) ; vertex 0, color 1
(declare-const p02 Bool) ; vertex 0, color 2

(declare-const p10 Bool) ; vertex 1
(declare-const p11 Bool)
(declare-const p12 Bool)

(declare-const p20 Bool) ; vertex 2
(declare-const p21 Bool)
(declare-const p22 Bool)

(declare-const p30 Bool) ; vertex 3
(declare-const p31 Bool)
(declare-const p32 Bool)

;-----------------------------------------------------------
; Vertex Constraints

; Each vertex gets at least one color.
(assert (or p00 p01 p02))
(assert (or p10 p11 p12))
(assert (or p20 p21 p22))
(assert (or p30 p31 p32))

; Each vertex gets at most one color.
(assert (not (and p00 p01)))
(assert (not (and p00 p02)))
(assert (not (and p01 p02)))

(assert (not (and p10 p11)))
(assert (not (and p10 p12)))
(assert (not (and p11 p12)))

(assert (not (and p20 p21)))
(assert (not (and p20 p22)))
(assert (not (and p21 p22)))

(assert (not (and p30 p31)))
(assert (not (and p30 p32)))
(assert (not (and p31 p32)))

;-----------------------------------------------------------
; Edge Constraints

; Edge （0，1）
(assert (not (and p00 p10)))
(assert (not (and p01 p11)))
(assert (not (and p02 p12)))

; Edge （0，2）
(assert (not (and p00 p20)))
(assert (not (and p01 p21)))
(assert (not (and p02 p22)))

; Edge （0，3）
(assert (not (and p00 p30)))
(assert (not (and p01 p31)))
(assert (not (and p02 p32)))

; Edge （1，2）
(assert (not (and p10 p20)))
(assert (not (and p11 p21)))
(assert (not (and p12 p22)))

; Edge （1，3）
(assert (not (and p10 p30)))
(assert (not (and p11 p31)))
(assert (not (and p12 p32)))

; Edge （2，3）
(assert (not (and p20 p30)))
(assert (not (and p21 p31)))
(assert (not (and p22 p32)))

;-----------------------------------------------------------
(check-sat)
(get-model)
