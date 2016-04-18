export default context => ({
	[context.Syntax.Str](node) {
		throw new Error('unimplemented')
	}
})
