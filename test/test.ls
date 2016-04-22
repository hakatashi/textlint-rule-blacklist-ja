require! {
  'textlint-tester'
  '../': blacklist-ja
}

tester = new textlint-tester!

tester.run do
  \blacklist-ja
  blacklist-ja

  valid:
    # No options
    * text: '吾輩は猫である。'

    # Single word
    * text: '高瀬舟は京都の高瀬川を上下する小舟である。'
      options: <[大阪]>

    # Multiple word
    * text: '私はその人を常に先生と呼んでいた。'
      options: <[坊っちゃん 草枕]>

  invalid:
    # 名詞
    * text: '安全第一'
      options:
        list: <[安全]>
      errors:
        * message: '禁止語句「安全」'
          line: 1
          column: 1
          ...

    # 動詞
    * text: '山路を登りながら、こう考えた。'
      options:
        list: <[登る]>
      errors:
        * message: '禁止語句「登る」'
          line: 1
          column: 4
          ...
