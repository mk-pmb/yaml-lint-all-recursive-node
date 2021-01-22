
<!--#echo json="package.json" key="name" underline="=" -->
yaml-lint-all-recursive
=======================
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
Run yamllint (from package yaml-lint) on **/*.y{a,}ml
<!--/#echo -->



API
---

None. Just CLI.


Usage
-----

```text
$ yaml-lint-all-recursive
test/ok.yaml: ✔ ok
test/wrong_quote.yaml: ✖ can not read an implicit mapping pair; a colon is missed at line 7, column 29:
      so: "this line is blamed."
                                ^
```


<!--#toc stop="scan" -->



Known issues
------------

* Needs more/better tests and docs.
* If you have a pair of opposite mismatching quotes in different lines,
  it can be totally valid YAML, albeit totally not what you meant.




&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
ISC
<!--/#echo -->
