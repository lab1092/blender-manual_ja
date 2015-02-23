
Blenderマニュアルの日本語翻訳
*******************************************************

   :ステータス: 現在試しに目次部分他翻訳中(MITSUDA,2014/11/7)


「協力者を募るとしたら」の前提で。
( `bf-docboard <http://lists.blender.org/mailman/listinfo/bf-docboard>`_ 
ではまだ原文のドキュメント更新フロー作成中とかいう段階ですね…)


取りうる2つの案(Sphinxプロジェクトとして)
===================================

1. Sphinxの国際化機能を使う(このリポジトリの方法)

      参考: `Internationalization <http://sphinx-doc.org/intl.html>`_ 
      ( `国際化 <http://docs.sphinx-users.jp/intl.html>`_ )

      Pros

         * manual/ フォルダのreSTファイルではなく、POファイルが翻訳・更新対象なので、原文は少なくとも守られる
         * パラグラフ単位で原文と同じマークアップを維持できるので翻訳時に覚えるreSTマークアップが少なくなる(はず)

      Cons

         * POファイルの編集の際、パラグラフ順が異なってしまうことがあり、編集しにくい
         * reST形式のテキストレイアウトを引用符の中で維持しないといけない
         * 幾つかのマークアップはPOファイルに出力されていないかもしれない
         * 原文がマークアップを間違えていたりするとPOファイルに語として登録されない
         * 画像の差し替えをするタイミングがビルド後になる
         * Fuzzyが許されない(本文に出てこないので)

2. 言語別にプロジェクトを用意する

      参考: `CakePHP CookBook  <https://github.com/cakephp/docs>`_

      Pros

         * 原文が間違えていたり、補足として原文にないパラグラフも記述可能
         * ビルド対象として別扱いに出来るので日本語用画像などを用意できる

      Cons

         * reST+Sphinxのマークアップがある程度わからないとやっていけない
         * reSTファイルとconf.pyを各言語ごとに用意しないといけない
         * ディレクトリ構成によっては原文を間違えて編集するとか容易に考えられる

結局のところ言語ごとに別々のドキュメントツリーが存在する感じになるのは否めないし、
現状のWikiライクに、英語ベージから[Japanese]を選んで日本語のページに遷移するとかは
少し細工が必要。

前提
===============================

現時点、このリポジトリでやってる方法だと、 **POファイルの中を訳せ** になるので。

* とりあえずSphinxとか、 ``make html`` わかってる。(マークアップはこれから覚える)
* 英語->日本語翻訳はなんとかできる(正確な訳でなくても)
* gitとかsvnっていうものがあることを知っている
* poとかmoとか聞いたことがある
* 問題が起きた時にもとりあえず調べて解決できそう


PO更新の仕方(草案)
==================================

フォルダ構成及び手順。大筋は https://developer.blender.org/T43083 で言及されているプロセスの通り。

なお、以下を実行した環境はOS X 10.10。
また、rtdは blender-manual-i18n.readthedocs.org/ja/latest/contents.html で生成されたものを確認できます。

フォルダ構成
------------------

将来的に統合されればいいのだけど、自身の環境では以下のようにしています。これは自身のgitリポジトリにコミット、
Read the Docsでドキュメント作成させていることから、取得ファイルに変更を加えてビルドする必要があるためです。

blender_docs がBFのSVNリポジトリのファイル取得場所、blender-manual/ が
POTファイルの生成、POファイルの更新(MOファイルの生成)、HTMLファイルのビルド環境。

   * ~/proj/
      * blender_docs/ (<- SVNリポジトリ取得場所。ここのファイルを適宜コピーすることになります。)
      * blender-manual_i18n/ (<- project for build)
         * html/
            * en/ (<-まあhtml直下にHTMLファイル配置、でもいけれども…)
            * ja/ (<-日本語のHTMLはここに格納されます。)
         * locale/
            * pot/ (<-potファイル。)
            * ja/ (<-日本語POファイルはここに。)
         * Makefile
         * manual/
            * conf.py (BFのconf.py内のlocaleの値を変更する必要があります。)


手順
----------

手順1を「原文がいくらか更新された、または一定期間経過した」タイミングで各自行い、4でPOT更新。
各自のローカル環境で5から7を随時行い、8でプッシュ、ということになるのかな?

   この時点でGit、Sphinxパッケージ、Sphinx_intlパッケージ等必要なものがインストールされているものとします。


1. ~/proj/blender_docs/ をbfのSVNリポジトリから取得するフォルダとして原文のファイルを取得。

      .. code-block::
        
         $ cd ~/proj/
         $ svn checkout https://svn.blender.org/svnroot/bf-manual/trunk/blender_docs
         
   一度取得したあとはcheckoutで差分が取得されます。
   
      .. code-block::

         $ cd ~/proj/
         $ svn checkout https://svn.blender.org/svnroot/bf-manual/trunk/blender_docs

2. gitリポジトリに、.gitignore ファイルの作成

 
   blender-manual_i18n フォルダ以下をgitの管理下におきます。


3. ビルドフォルダの作成とファイルコピー

   blender-manual_i18n フォルダ以下にフォルダを適宜作成します。

      .. code-block::

         $ cd ~/proj/
         $ mkdir blender-manual_i18n
         $ cd ~/proj/blender-manual_i18n/
         $ mkdir html
         $ cd ~/proj/blender-manual_i18n/html/
         $ mkdir en
         $ mkdir ja         
         $ cd ~/proj/blender-manual_i18n/
         $ mkdir locale
         $ cd ~/proj/blender-manual_i18n/locale/
         $ mkdir pot
         $ mkdir ja
         

   blender_docs/manual のファイルを blender-manual_i18n/manual に上書きコピーします。
   他のファイルはビルドができる限りはそのままでいいと思います。差分を確認して作業を進めます。
   
   manual/conf.py のi18n指定の箇所(ファイル最後の方にあります)の値を変更('../locale/pot/')します。 

      .. code-block::

         locale_dirs = ['../locale/pot/']   # path is example but recommended.
         gettext_compact = False     # optional.


4. POTファイルの生成・更新

      .. code-block::

         $ cd ~/proj/blender-manual_i18n/
         sphinx-build -b gettext ./manual ./locale/pot
         $ sphinx-intl update -d ./locale/ -p ./locale/pot -l ja

5. POファイルの編集(日本語)

   poeditor あたりで .po ファイルを編集します。

6. MOファイルの生成

      .. code-block::

         $ cd ~/proj/blender-manual_i18n/
         $ sphinx-intl build -d ./locale/

7. make html してHTMLファイルを html/ja に作成(環境ができているとして)

      .. code-block::

         $ cd ~/proj/blender-manual_i18n/
         $ sphinx-build -D language='ja' -b html ./manual ./html/ja

8. 正しく訳せていたなら、POファイルをBFのリポジトリにCommit?(ここが想定出来てないので「どこに？」っていう感じ)


回避したいこと
===================

BlenderのUI翻訳のように別リポジトリとか、毎週一回原文マージとか、クソ面倒くさいことありえませんから。

未翻訳は原文がそのまま表示されるんですけど、POファイルのエラー(ダブルクオート括り忘れとか)で
PO更新コマンドが以降のファイルを処理しないとかすると「あれー、翻訳したのに反映されてない」が続くとか、
その辺はどうチェックしたらいいんでしょうね？

