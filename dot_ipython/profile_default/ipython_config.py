# Configuration file for ipython.

c = get_config()

c.TerminalInteractiveShell.confirm_exit = False

c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload 2')
