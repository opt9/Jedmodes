% Mode for editing INI files.
%
% Copyright (c) 2017 Jeremy Bae
%


private variable mode = "ini";

% Now create and initialize a simple syntax table.
create_syntax_table (mode);
% define_syntax ("#", "", '%', mode);		% comments
% define_syntax (";", "", '%', mode);		% comments
% define_syntax ("[", "]", '(', mode);		% parentheses
% define_syntax ('"', '"', mode);			% strings
% define_syntax ("0-9a-zA-Z_", 'w', mode);		% identifiers
% define_syntax ("0-9a-fA-F.xXL", '0', mode);	% numbers
% define_syntax ("+-=:", '+', mode);	% operators
set_syntax_flags (mode, 4);

#ifdef HAS_DFA_SYNTAX
dfa_enable_highlight_cache("ini.dfa", mode);

dfa_define_highlight_rule("#.*$", "comment", mode);
dfa_define_highlight_rule(";.*$", "comment", mode);
dfa_define_highlight_rule("\[(.*)\]"R, "keyword0", mode);
dfa_define_highlight_rule("[\+\-0-9]*"R, "number", mode);
dfa_define_highlight_rule("['\"].*['\"]", "string", mode);
dfa_define_highlight_rule("=", "delimiter", mode);

dfa_build_highlight_table(mode);
enable_dfa_syntax_for_mode(mode);
#endif

public define ini_mode ()
{
   TAB = 4;
   set_mode (mode, 4); % flag value of 4 is generic language mode
   % use_keymap(mode);
   % set_buffer_hook ("indent_hook", "ini_indent_line");
   % set_buffer_hook ("newline_indent_hook", "ini_newline_and_indent");
   use_syntax_table (mode);
   run_mode_hooks ("ini_mode_hook");
}


provide("ini");
