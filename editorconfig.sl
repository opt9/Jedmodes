% Mode for EditorConfig
%
% Copyright (c) 2017 Jeremy Bae
%


private variable mode = "editorconfig";

% Now create and initialize a simple syntax table.
create_syntax_table (mode);
set_syntax_flags (mode, 4);

#ifdef HAS_DFA_SYNTAX
dfa_enable_highlight_cache("editorconfig.dfa", mode);

dfa_define_highlight_rule("#.*$", "comment", mode);
dfa_define_highlight_rule(";.*$", "comment", mode);
dfa_define_highlight_rule("\[(.*)\]"R, "keyword0", mode);
dfa_define_highlight_rule("[\+\-0-9]*"R, "number", mode);
dfa_define_highlight_rule("['\"].*['\"]", "string", mode);
dfa_define_highlight_rule("=", "delimiter", mode);

dfa_build_highlight_table(mode);
enable_dfa_syntax_for_mode(mode);
#endif

public define editorconfig_mode ()
{
   TAB = 4;
   set_mode (mode, 4); % flag value of 4 is generic language mode
   % use_keymap(mode);
   % set_buffer_hook ("indent_hook", "editorconfig_indent_line");
   % set_buffer_hook ("newline_indent_hook", "editorconfig_newline_and_indent");
   use_syntax_table (mode);
   run_mode_hooks ("editorconfig_mode_hook");
}


provide("editorconfig");
