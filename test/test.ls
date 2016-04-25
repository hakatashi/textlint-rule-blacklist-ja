require! {
  'textlint-tester'
  'es6-promise'
  '../': blacklist-ja
}

# Polyfill `Promiss` for PhantomJS testing environment
es6-promise.polyfill!

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

    # Multiple words
    * text: '私はその人を常に先生と呼んでいた。'
      options: <[坊っちゃん 草枕]>

    # Same pronounse but different meaning
    * text: '或日の暮方の事である。一人の下人が、羅生門の下で雨やみを待っていた。'
      options: <[飴]>

  invalid:
    # 名詞
    * text: '安全第一'
      options: <[安全]>
      errors:
        * message: '禁止語句「安全」'
          line: 1
          column: 1
          ...

    # 動詞
    * text: '山路を登りながら、こう考えた。'
      options: <[登る]>
      errors:
        * message: '禁止語句「登る」'
          line: 1
          column: 4
          ...

    # 形容詞
    * text: '小さな谷川の底を写した二枚の青い幻燈です。'
      options: <[小さい]>
      errors:
        * message: '禁止語句「小さい」'
          line: 1
          column: 1
          ...

    # 記号
    * text: '桜の樹の下には屍体が埋まっている！'
      options: <[！]>
      errors:
        * message: '禁止語句「！」'
          line: 1
          column: 17
          ...

    # 複合語
    * text: '木曽路はすべて山の中である。'
      options: <[山の中]>
      errors:
        * message: '禁止語句「山の中」'
          line: 1
          column: 8
          ...

    # かな表記
    * text: '台所でスパゲティーをゆでているときに、電話がかかってきた。'
      options: <[茹でる]>
      errors:
        * message: '禁止語句「茹でる」'
          line: 1
          column: 11
          ...

    # 複数一致
    * text: '国境の長いトンネルを抜けると雪国であった。夜の底が白くなった。'
      options: <[国境 雪国 白い]>
      errors:
        * message: '禁止語句「国境」'
          line: 1
          column: 1
        * message: '禁止語句「雪国」'
          line: 1
          column: 15
        * message: '禁止語句「白い」'
          line: 1
          column: 26

    # 複数回一致
    * text: '青いくるみも吹きとばせ すっぱいかりんも吹きとばせ'
      options: <[吹き飛ばす]>
      errors:
        * message: '禁止語句「吹き飛ばす」'
          line: 1
          column: 7
        * message: '禁止語句「吹き飛ばす」'
          line: 1
          column: 21
