(defun factorial (x) "Returns factorial of x" (if (eq x 0) 1 (* x (- x 1))))
(defun fib (x) "Returns xth fibonacci number" (if (< x 2) 1 (+ (fib (- x 1)) (fib (- x 2)))))

(defun two-sum (nums target)
  "Checks if any 2 numbers from nums can sum to target, if they can returns their indicies"
    (defun helper (nums target cache position)
      (let ((fst (car nums)) 
            (rst (cdr nums)))
        (cond
          ((null fst) '())
          ((null (gethash fst cache))
            (progn 
              (setf (gethash (- target fst) cache) position)
              (helper rst target cache (+ position 1))))
          (t (list (gethash fst cache) position)))))
    (helper nums target (make-hash-table) 0))

(defun is-armstrong-number? (x)
  "Checks if the given number is armstrong number"
  (defun count-digits (x) (if (eq x 0) 0 (1+ (count-digits (truncate x 10)))))
  (defun helper (x count) (if (eq x 0) 0 (+ (expt (mod x 10) count) (helper (truncate x 10) count))))
  (eq (helper x (count-digits x)) x))

(defun binary-search (vec x)
  "This function takes a vec and a num, and returns one of
    1. If the number is found: 'Found, <posistion>
    2. If the number is not found: 'NotFound <position the number can be inserted at>"
    (defun helper (vec x left right) 
      (let 
        ((mid (truncate (/ (+ right left) 2))))
        (cond 
          ((eq left right) (values 'NotFound left))
          ((eq x (aref vec mid)) (values 'Found mid))
          ((< x (aref vec mid)) (helper vec x left mid)) 
          (t (helper vec x (+ 1 mid) right)))))
    (helper vec x 0 (length vec)))
