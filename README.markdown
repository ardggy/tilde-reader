TILDE-READER
============
The syntax suger of `complement`.

`complement` 関数の糖衣構文を提供します。

REQUIREMENT
-----------
* unset-macro-character

TESTING
-------

    (asdf:test-system :tilde-reader)

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
