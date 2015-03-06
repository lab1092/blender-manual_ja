sphinx-build -b gettext ./manual ./build/locale/pot
sphinx-intl update -d ./build/locale/ -p ./build/locale/pot -l ja
sphinx-intl build -d ./build/locale/
sphinx-build -D language='ja' -b html ./manual ./build/html/ja