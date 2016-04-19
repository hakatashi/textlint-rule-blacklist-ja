require! {
  'textlint-tester'
  '../': blacklist-ja
}

tester = new textlint-tester!

tester.run do
  \blacklist-ja
  blacklist-ja

  valid:
    * text: ''
    * text: '安全第一'
      options:
        list: <[危険]>

  invalid:
    * text: '危険第一'
      options:
        list: <[危険]>
      errors: [
        message: '禁止語句「危険」'
        line: 1
        column: 1
      ]

    * text: '山路を登りながら、こう考えた。'
      options:
        list: <[登る]>
      errors: [
        message: '禁止語句「登る」'
        line: 1
        column: 4
      ]
