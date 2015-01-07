sphinx-build -b gettext ./manual ./locale/pot
sphinx-intl update -d ./locale/ -p ./locale/pot -l ja
sphinx-intl build -d ./locale/
sphinx-build -D language='ja' -b html ./manual ./html/ja
