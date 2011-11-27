TILDE-READER
============
The syntax suger of `complement`.

`complement` 関数の糖衣構文を提供します。


REQUIREMENT
-----------
* SBCL
* CMUCL

This would work in other implementations, but yet tested.

他の実装でも動作するとは思いますが、テストは試してません。


TESTING
----

    (asdf:test-system :tilde-reader)

USAGE
-----

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

Equivalent to following expression, either

これは以下に相当する式です。

    (remove-if (complement #'null) '(nil t))

or

あるいは

    (remove-if-not #'null '(nil t))


LICENCE
-------
MIT License.

----------

Thank you for reading.

----------

Copyright (C) Toshihisa Abe <<toshihisa.abe@gmail.com>>




