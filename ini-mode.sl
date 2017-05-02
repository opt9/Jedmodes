% Mode for editing INI files.
%
% Copyright (c) 2017 Jeremy Bae
%
%


private variable mode = "ini";

% Now create and initialize a simple syntax table.
create_syntax_table (mode);
define_syntax ("#", "", '%', mode);		% comments
define_syntax (";", "", '%', mode);		% comments
define_syntax ("[", "]", '(', mode);		% parentheses
define_syntax ('"', '"', mode);			% strings
define_syntax ("0-9a-zA-Z_", 'w', mode);		% identifiers
define_syntax ("0-9a-fA-F.xXL", '0', mode);	% numbers
define_syntax ("+-=:", '+', mode);	% operators
set_syntax_flags (mode, 4);


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
