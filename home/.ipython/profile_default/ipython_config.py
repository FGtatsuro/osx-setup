from IPython.terminal.prompts import Prompts, Token
import os

class DocTestPrompt(Prompts):

    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '>>> ')]

    def out_prompt_tokens(self):
        return [(Token.Prompt, '')]

# c.TerminalInteractiveShell.prompts_class = 'IPython.terminal.prompts.Prompts'
c.TerminalInteractiveShell.prompts_class = DocTestPrompt
