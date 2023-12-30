require("dapui").setup()
local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "lldb-vscode",
	name = "lldb",
}
local lldb = {
	name = "Launch lldb",
	type = "lldb",
	request = "launch",
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" }
}
local gdb = {
	name = "Launch",
  type = "gdb",
	request = "launch",
	program = function()
	  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = "${workspaceFolder}",
	--stopOnEntry = false,
	--args = {},
	--runInTerminal = false,
}
dap.configurations.c = {
	--gdb,
	lldb,
}
