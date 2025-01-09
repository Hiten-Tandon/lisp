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
  (defun count-digits(x) (if (eq x 0) 0 (1+ (count-digits (truncate x 10)))))
  (defun helper (x count) (if (eq x 0) 0 (+ (expt (mod x 10) count) (helper (truncate x 10) count))))
  (eq (helper x (count-digits x)) x))
