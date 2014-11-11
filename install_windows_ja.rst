
Blenderマニュアルのインストールガイド
*******************************************************

.. caution::
   [訳者注]このドキュメントは"install_windows.rst"を日本語に訳したものです。
   なお、OS Xについては 
   `Blenderのマニュアルをローカル環境でビルドする <http://lab1092.wordpress.com/2014/10/29/blender%E3%81%AE%E3%83%9E%E3%83%8B%E3%83%A5%E3%82%A2%E3%83%AB%E3%82%92%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E7%92%B0%E5%A2%83%E3%81%A7%E3%83%93%E3%83%AB%E3%83%89%E3%81%99%E3%82%8B/>`_
   にビルドした手順を載せていますので、ご参考まで。
   
   なお、対象となるリポジトリは https://github.com/lab1092/blender-manual_i18n ではないのでお間違いなきよう。
   
このガイドにはWindows 8.1を使用しました。

コンピューターにgitをインストールする
===============================

- Windowsのgitインストールパッケージをここからダウンロードします。: http://git-scm.com/download/win

   *このガイドでは、バージョン1.9.4を使用しています。*

- インストレーションウィザードに従ってgitをインストールします。

   *このガイドではデフォルト設定を使用します。gitはのインストール先はこちらです。 C:\\Program Files (x86)\\Git*

- インストールが成功したことを確かめるためにGit bashをスタートメニューから開始します。 

   *Git bash が開き、コンソールプロンプトの$が表示されたらプロンプトにて以下で言及するものに従います。*

.. tip::

   Windowsのクリップボードを使えるので
   ウィンドウ左隅のGit Bashアイコンをクリックするとエディット時のコマンドを使用できます。


Pythonをインストールする
==================================

- Windows 向け Python インストールパッケージをここからダウンロードします: https://www.python.org/downloads/

   *このガイドでは 3.4.1 を使います*

- インストールウィザードに従ってインストールします。
 
   *このガイドではデフォルト設定でインストールします。ファイルは C:\\Python34 にインストールされます。*

- 以下の手順で正常にインストールできたことを確認します。
   - Git Bashを開始します。
   - ``cd /c/Python34/`` とプロンプトに入力し、実行します。
   - ``python`` とプロンプトに入力し、実行します。 Pythonシェルが開始し、 Pythonのバージョンが表示されます。
   - ``exit()`` と Python prompt に入力し、Enterきーを押すとPythonシェルを抜けます。


GitリポジトリからBlenderマニュアルをダウンロード
=============================================
- エクスプローラーを使ってディスク上に新しいフォルダを作成します。.

  *このガイドでは C:\\blender\\ を使います。*

- Git Bashを実行していない場合には、開始します。
- 新しいフォルダに移って以下のコマンドを実行します。:

  .. code-block:: bash

     cd /c/blender

- ディスクにGitリポジトリのBlenderマニュアルをダウンロードするためにプロンプト上でこのコマンドを実行します。:

  .. code-block:: bash

     git clone git://git.blender.org/blender-manual.git

  *ダウンロードが終了したら右のマークが表示されます* ``$``
  *ディスク上にはblender-manual (C:\\blender\\blender-manual) が作成されています*


ローカルコピーをセットアップする
=================================

- "C:\\blender\\blender-manual\\requirements.txt" をテキストエディタで開きます (e.g.ノードパッド).
- 最後の行``wsgiref==0.1.2`` を削除して、ファイルを保存します。

  *この行はPython3.4.1ですでに標準パッケージに含まれているwsgirefをインストールしないようにするための措置です。*

- Git Bashを実行していない場合には、開始します。
- Gitリポジトリからダウンロードされたローカル上の複製として新しく作成された blender-manual
  フォルダにプロンプト上で移動します。

  .. code-block:: bash

     cd /c/blender/blender-manual

     /c/Python34/Scripts/pip install -r requirements.txt

  *たくさんのログ出力があります。最後に右のマークが表示されます* ``$`` *そして以下のメッセージが表示されます:*

  ``Successfully installed Jinja2 MarkupSafe Pygments Sphinx docutils sphinx-rtd-theme Cleaning up...`` ...is shown.

  インストール中に幾つかの警告が表示されますが, 問題はありません。 エラーが出ないことが重要です。


はじめてBlenderマニュアルをビルドする
==========================================

- Git Bashを実行していない場合には、開始します。
- blender-manual フォルダに移動し、以下のコマンドを実行しマニュアルをビルドします。:

  .. code-block:: bash

     cd /c/blender/blender-manual

     /c/Python34/Scripts/sphinx-build -b html ./manual ./html

  *ビルドプロセスは少し時間がかかり、パーセンテージで進み具合を確認できます。
  最後に"build succeeded" と表示され、プロンプトが帰ってきます。
  ビルドされたマニュアルは html フォルダに出力されます。(C:\\blender\\blender-manual\\html).*

- 実行しているGit Bash を抜ける場合には、プロンプト上で ``exit`` コマンドを実行します.
- Webブラウザで "C:\\blender\\blender-manual\\html\\contents.html" を開いてマニュアルを読むことができます。

これでWindows上でのBlenderマニュアルインストール作業は完了しました。
次のステップはBlender Manual project documentationのドキュメントの編集です。
The next steps for editing the manual are shown in the Blender Manual project documentation.

