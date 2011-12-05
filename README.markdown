TILDE-READER
============
The syntax suger of `complement`.

`complement` 関数の糖衣構文を提供します。

DEPENDENCY
-----------
* unset-macro-character
* fiveam

TEST
----

    (asdf:test-system :tilde-reader)

Tested under the following implementations:

下記の実装でのテストを行っています。

* SBCL 1.0.53
* CMUCL 20b 20c
* Clozure CL 1.6 1.7
* CLISP 2.49
* ECL 11.1

USAGE
-----

Enable syntax in current readtable.

構文を有効にします。

    (tilde-reader:install)

Disable syntax in current readtable.

構文を無効にします。

    (tilde-reader:uninstall)

Complement of `lambda` predicate.

無名述語の否定を生成します。

    (funcall ~(lambda () t))
    ; => nil

    (funcall ~#'(lambda () nil))
    ; => t

Complement of predicate.

述語の否定関数を生成します。

    (remove-if ~#'null '(nil t))
    ; => (nil)

Equivalent to following expression,

これは以下のふたつの式に相当します。

    (remove-if (complement #'null) '(nil t))

or

あるいは

    (remove-if-not #'null '(nil t))


TODO
----

* Refactoring the tests.
* Loading without lisp-unit.

LICENCE
-------
MIT License.

----------

Thank you for reading.

----------

Copyright (C) Toshihisa Abe <<toshihisa.abe@gmail.com>>
