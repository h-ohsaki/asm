#!/usr/bin/env python3

def main():
    while True:
        try:
            # 文字列を読み込んで整数に変換する
            v = int(input('? '))
        except EOFError:
            # 読み込めなければループから抜ける
            break
        except ValueError:
            # 整数に変換できなければループから抜ける
            break
        print(f'0b{v:b}\t{v}\t0x{v:x}')

if __name__ == "__main__":
    main()
