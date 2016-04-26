'use strict';

const kuromoji = require('kuromoji')
const path = require('path')

module.exports = context => ({
	[context.Syntax.Str](node) {
		const text = context.getSource(node)

		return new Promise((resolve, reject) => {
			kuromoji.builder({}).build((error, tokenizer) => {
				resolve()
			})
		})
	}
})
