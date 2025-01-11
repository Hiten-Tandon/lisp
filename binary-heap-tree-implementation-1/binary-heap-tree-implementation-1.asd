(defsystem "binary-heap-tree-implementation-1"
  :version "0.0.1"
  :author "Hiten Tandon<tandonhiten@gmail.com>"
  :license "MIT"
  :depends-on ("defstar")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "A binary tree based binary heap implementation"
  :in-order-to ((test-op (test-op "binary-heap-tree-implementation-1/tests"))))

(defsystem "binary-heap-tree-implementation-1/tests"
  :author "Hiten Tandon"
  :license "MIT"
  :depends-on ("binary-heap-tree-implementation-1"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for binary-heap-tree-implementation-1"
  :perform (test-op (op c) (symbol-call :rove :run c)))
