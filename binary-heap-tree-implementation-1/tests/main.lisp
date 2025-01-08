(defpackage binary-heap-tree-implementation-1/tests/main
  (:use :cl
        :binary-heap-tree-implementation-1
        :rove))
(in-package :binary-heap-tree-implementation-1/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :binary-heap-tree-implementation-1)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
