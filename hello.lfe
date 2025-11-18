// LFE (Lisp Flavored Erlang)
(defmodule hello
  (export (hello 0) (greet 1)))

(defun hello ()
  (io:format "Hello, World!~n"))

(defun greet (name)
  (io:format "Hello, ~s!~n" (list name)))
