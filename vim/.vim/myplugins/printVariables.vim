" printVariables: tool to create print statements for variables, arrays, and hashes 
"   Author:	 Jason Frerich
"   Date:    5/24/2012

if has('perl')

perl << EOF
use Data::Dumper;

####################################
sub PrintVariables_perl {

    my (@command) = @_;

	# PrintStyle is the returning print style
	# 0 = ONE variable per line
	# 1 = All variables on ONE line
	my $PrintStyle = shift(@command);

   	my $line = VIM::Eval("getline(\".\")"); # get the line string

	$line =~ s/(^\s+)//;
	my $whitespace = $1;

	# add a tab to beginning of print line for lines with these statements.
	# will line up one tab over.
	$whitespace .= "\t" if ($line =~ /if|else|elsif|for|foreach|while/); 

    ### EndingArray (determine end of variable name)
    # special characters must be escaped
    my $charHash = {};
    $charHash->{array}->{EndingVars} = {
			"," => 1, 
			"\\" => 1, 
			" " => 1, 
			";" => 1, 
			")" => 1, 
			"+" => 1};
			
	$charHash->{vars}->{EndingVars} = {
			"," => 1,
			"\\" => 1,
			"\\s" => 1,
			" " => 1,
			";" => 1,
			")" => 1,
			"+" => 1,
			"}" => 1,
			"'" => 1,
			"\/" => 1,
		    "\\" => 1};
    # Characters defining the beginning of an array or variable
    $charHash->{vars}->{isvar} = "\\\$";
    $charHash->{array}->{isvar} = "@";

	# omit variables
	my $omitArrayHash = {};
    $omitArrayHash->{vars} = {
        '\@\$'   => 1,
        '@\$'    => 1,
        '\@\\\$' => 1,
        '-'      => 1,
        "!"      => 1
	};

	# do vars, array, or both...
	foreach my $command (@command) {
	
    	my @linearray = (); # array with each character in the line as entry in the array
    	my @vararray  = (); # array containing variables for printing
	
		my $isVarsVariable = $charHash->{vars}->{isvar};
		my $isArrayVariable = $charHash->{array}->{isvar};
		my $printline;

    	# if the line does not have a variable/array/hash error out and return
		if ($line !~ /$isVarsVariable|$isArrayVariable/) {
			print "\n\nLine \"$line\" does not contain any variables (ie. ${isVarsVariable}'s or ${isArrayVariable})!\n";
		}
    	next if ($line !~ /$isVariable/); 
	
		# break the line into an array, each character as an entry
		@linearray = split(// , $line);
		@vararray = CreateVariables($command,\@linearray,$charHash,$omitArrayHash);
	
		# dumper statement
	
	    foreach my $var (@vararray) {
	
			my $printline = "${whitespace}print \"";

			if ($command eq "array") {
	
				my $var_no_special_characters = $var;
				$var_no_special_characters =~ s/\$/\\\$/g;
	
				$printline .= "### $var_no_special_characters ###\\n\", ";
				$printline .= "Dumper(\@$var)";

	    		# complete the print statement
	    		$printline .= ", \"\\n\";";
				insertPrintStatement($printline);
			}
			# variable statement
			elsif ($command eq "vars") {
	
				$printline .= "$var=\$$var";
	
				# add , if not the last print variable
				if ($var ne @vararray[$#vararray]) {
		    		$printline .= ", ";
				}
	    		# complete the print statement
	    		if ($PrintStyle eq 0) {
	    			$printline .= "\\n\";" 
				}
	    		elsif ($PrintStyle eq 1) {
	    			$printline .= "" ;
				}
				insertPrintStatement($printline);
			}
			# add , if not the last print variable
			if ($var ne @vararray[$#vararray]) {
		    	$printline .= ", ";
			}
		}
	}
		#VIM::DoCommand(":echo  '\n    LINE = $line'");
		#VIM::DoCommand(":echo 'PRINTLINE= $printline'"); 
}
	
####################################
sub insertPrintStatement {

	my ($printline) = @_;

	#print "PRINTLINE = $printline\n";
	my $current_lnum = VIM::Eval("line(\".\")"); # get line number
	$current_lnum++;

	VIM::DoCommand(":execute 'norm! o'");
	VIM::DoCommand(":call setline($current_lnum, '$printline')"); # move cursor away from first character in line otw will not find Path () on current line, but one up.
}

####################################
sub CreateVariables {
	
	my ($command,$linearray,$charHash,$omitArrayHash) = @_;	

	my @linearray = @$linearray;	
    my $savevar = 0;
	my @vararray = ();
	my $isVariable = $charHash->{$command}->{isvar};

	# read each character in the line
	foreach my $char (@linearray) {
	    if ($char =~ /$isVariable/) {
			$savevar = 1;
			$var = ""; 
			next;
	    }
	    # check if hit an ending character
	    if ($savevar eq 1) {
			if ($charHash->{$command}->{EndingVars}->{$char}) {
				$savevar = 0;

				next if (defined $omitArrayHash->{$command}->{$char}); 
				push (@vararray,$var);
			}
	    }
		$var .= $char if ($savevar eq 1); 
	}
	return (@vararray);
}
EOF

function PrintVariables_Vim()
  perl PrintVariables_perl("0", "vars", "array");
endfunction

function PrintVariables_oneline_Vim()
  perl PrintVariables_perl("1", "vars", "array");
endfunction

command -nargs=?  PrintVariables            :call PrintVariables_Vim() 
command -nargs=?  PrintVariablesOneLine    :call PrintVariables_oneline_Vim() 
	
endif
