# 「独習アセンブラ」サポートページ

## プログラムのソースコード

本書に掲載しているプログラムのソースコードは以下からダウンロードできます。

- GitHub 上で閲覧

    https://github.com/h-ohsaki/asm/tree/master/code

- アーカイブ (tar + gzip 形式) をダウンロード

    https://github.com/h-ohsaki/asm/raw/master/code-210828.tar.gz

- アーカイブ (Zip 形式) をダウンロード

    https://github.com/h-ohsaki/asm/raw/master/code-210828.zip

## Docker コンテナ

本書で使用しているツールやライブラリ一式をインストールした Docker コンテナを、
Docker Hub 上で公開しています。

- Debian GNU/Linux (bullseye) (i386) (32 ビット版)

    https://hub.docker.com/r/hohsaki/asm-i386

- Debian GNU/Linux (bullseye) (amd64) (64 ビット版)

    https://hub.docker.com/r/hohsaki/asm

IA-32 アーキテクチャ、COMET II、AVR アーキテクチャ、Armv8-A アーキテク
チャ向けのコンパイルやアセンブルには 32 ビット版をご利用ください。

Intel 64 アーキテクチャ向けのコンパイルやアセンブルには 64 ビット版を
ご利用ください。

Docker が利用できる環境であれば、
GNU/Linux、
macOS、
Windows いずれのオペレーティングシステムでも上記のコンテナを利用できます。
ただし、
コンテナのアーキテクチャが i386 および amd64 ですので、
インテルもしくは AMD の CPU を搭載したコンピュータが必要です。

Docker エンジンを動作させているホストコンピュータが 64 ビット (x86-64/amd64) でも、
32 ビット版のコンテナを動作させることができます。
したがって、
例えば 64 ビット版の Windows 上で、
32 ビット版 (i386) の Docker コンテナ (asm-i386) を利用できます。

Docker のインストール方法や利用法については、
以下のページをご覧ください。

- docker docs

    https://docs.docker.com/

## 章末問題への回答

翔泳社のページをご覧ください (掲載予定)。

https://www.shoeisha.co.jp/

## 正誤表

翔泳社のページをご覧ください (掲載予定)。

https://www.shoeisha.co.jp/book/errata/

## 本書に対する問い合わせ

翔泳社のページからお問い合わせください。
本 GitHub ページからのお問い合わせは受付けておりませんのでご注意ください。

https://www.shoeisha.co.jp/book/qa/

## 掲示板

本書に関する掲示板として、
Discussions (https://github.com/h-ohsaki/asm/discussions) をご利用いただけます。

## その他

- org ファイル

    https://github.com/h-ohsaki/modern-asm
