(uiop:define-package binary-heap-tree-implementation-1
  (:use #:cl))
(in-package #:binary-heap-tree-implementation-1)

(require :defstar)

(deftype option (ty)
  "Option type can either be (:some . ty)  or none"
  `(or
     (cons (member :some) ,ty)
     (member :none)))

(deftype comparision () `(member :bigger :smaller :eq))

(defstar:defgeneric* comparator ((x 'a) (y 'a)) (:returns comparision) "Compares the input values")

(defmacro make-comparator (t1 t2 lesser greater)
  `(progn
    (defstar:defmethod* 
      comparator ((x ,t1) (y ,t2))
      (:returns comparision)
      (cond 
        ((,lesser x y) :smaller)
        ((,greater x y) :bigger)
        (t :eq)))
    ,@(if (not (eq t1 t2))
      `(defstar:defmethod* 
        comparator ((x ,t2) (y ,t2))
        (:returns comparision)A
        (cond 
          ((,lesser x y) :bigger)
          ((,greater x y) :smaller)
          (t :eq))))))

(make-comparator number number < >)
(make-comparator string string string< string>)
(make-comparator character character char< char>)

(defclass binary-heap-node-of 
  (type :type symbol)
  (val :type type)
  (left :type (option (binary-heap-node-of type)))
  (right :type (option (binary-heap-node-of type))))

(defclass binary-heap-of
  (type :type symbol)
  (root :type (option (binary-heap-node-of type)))
  (comp comparator :type (function (type type) comparision)))
