module.exports = context => ({
	[context.Syntax.Str](node) {
		throw new Error('unimplemented')
	}
})
