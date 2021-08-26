// 標準入力から読み込んだテキストファイルの改行コードを判定するプログラム

#include <stdio.h>
#include <string.h>

int main(void)
{
	// FIXME: 1 行が BUFSIZ より短かいことを仮定した手抜きプログラム
	char buf[BUFSIZ];
	// 標準入力から 1 行を buf に読み込む
	if (fgets(buf, BUFSIZ, stdin) != NULL) {
		// 文字列の長さを取得する
		int len = strlen(buf);
		// len -1 は LF なので、len - 2 をチェック
		if (buf[len - 2] == '\r')	// CR か?
			printf("CRLF\n");
		else
			printf("LF\n");
	}
	return 0;
}
