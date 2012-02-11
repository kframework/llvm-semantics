use strict;
use File::Basename;
use Encode;
use MIME::Base64;
use XML::LibXML::Reader;

binmode STDOUT, ":utf8";
binmode STDIN, ":utf8";

# not handling the case of multiple cdatas 
# can use 'erase' to get rid of junk cells

# 0 for 'Label`(_`,_`,_`,_`,_`)
# 1 for 'Label
my $basicLabel = 0;

my $STRING = "#";
my $ID = "#";
my $BOOL = '#';
my $RAT = '#';

#########################################################
# you may want to configure things inside this section
use constant KLIST_IDENTITY => ".List{K}";
use constant KLIST_SEPARATOR => ",, ";

# my $ltl = "";

my %arityMap = ();

# might want to return, say, "'$name"
sub nameToLabel {
	my ($name, $length) = (@_);
	my $baseLabel = "'$name";
	if ($basicLabel) { return $baseLabel; }
	if (exists($arityMap{$name})) {
		if ($arityMap{$name} != $length) {
			print STDERR "WARNING: Detected label with multiple arities: label \"$name\" has arities $arityMap{$name} and $length\n";
		}		
	} else {
		$arityMap{$name} = $length;
	}
	if ($length == 0) { return $baseLabel; }
	
	my $suffix = "`(_";
	for (my $i = 0; $i < $length-1; $i++){
		$suffix .= "`,_"
	}
	$suffix .= "`)";
	return "$baseLabel$suffix";
}
#########################################################
my %escapeMap = (
	"\007" => '\\a',
	"\010" => '\\b',
	"\011" => '\\t',
	"\012" => '\\n',
	"\013" => '\\v',
	"\014" => '\\f',
	"\015" => '\\r',
	'"' => '\\"',
	'\\' => '\\\\'
);



my $input = join("", <STDIN>);

# my %ignoreThese = (	
	# 'Filename' => 1,
	# 'Lineno' => 1,
	# 'Byteno' => 1,
	# 'OffsetStart' => 1,
	# 'OffsetEnd' => 1,
	# 'Ident' => 1,
	# 'BlockId' => 1,
	# 'SwitchId' => 1,
	# 'Lineno' => 1,
	# 'CompoundLiteralId' => 1,
	# 'CaseId' => 1,
	# 'ForId' => 1,
	# 'SourceCode' => 1,
	# 'DeclarationType' => 1,
	# 'Variable' => 1,
	# 'Paren' => 1,
	# 'Significand' => 1,
	# 'Exponent' => 1,
	# 'TypeQualifier' => 1,
	# 'StorageSpecifier' => 1,
	# 'FunctionSpecifier' => 1,
	# 'Specifiers' => 1,
	# 'TypeSpecifier' => 1,
	# 'LocalDefinition' => 1,
	# 'IntLiteral' => 1,
	# 'FloatLiteral' => 1,
	# 'ForClauseDeclaration' => 1,
# );

# foreach my $key (keys %labelMap) {
	# $handlers->{$key} = sub { $_->set_tag($labelMap{$key}); };	
# }

my $reader = new XML::LibXML::Reader(string => $input) or die "cannot create XML::LibXML::Reader object\n";
$reader->read;

my $tu = xmlToK($reader);
print "$tu\n";

# if (! ($reader->name eq "TranslationUnit")) {
	# die "XML: Expected first entry to be 'TranslationUnit'.";
# }
# $reader->nextElement('RawData');
# # print STDERR "At " . $reader->name . "\n";
# my $filename = getRawData($reader);
# if ($filename eq ""){
	# die "Could not find the filename in the XML\n";
# }

# print "---kccMarker\n";
# my @args = ();
# push (@args, "$STRING $filename" . paren(KLIST_IDENTITY));

# $reader->nextElement;
# # print STDERR "At " . $reader->name . "\n";
# push (@args, xmlToK($reader));

# #$reader->nextElement;
# # print STDERR "At " . $reader->name . "\n";
# push (@args, xmlToK($reader));

# $reader->nextElement('RawData');
# # print STDERR "At " . $reader->name . "\n";
# my $sourceCode = getRawData($reader);
# push (@args, "$STRING $sourceCode" . paren(KLIST_IDENTITY));
# my $tu = paren(join(KLIST_SEPARATOR, @args));
# print "eq TranslationUnitName($filename)(.List`{K`}) = " . nameToLabel('TranslationUnit') . $tu . ".\n";
# if ($ltl ne "") {
	# print $ltl;
# }



sub printStatus {
	my ($reader) = (@_);
	print "visit: " . $reader->name . "\n";
	print "isempty: " . $reader->isEmptyElement . "\n";
	print "value: " . $reader->value . "\n";
	print "type: " . $reader->nodeType . "\n";
}

# this function tries to figure out what kind of a node we're looking at, then delegates the conversion to another function
sub xmlToK {
	my ($reader) = (@_);
	#printStatus($reader);
	if (! ($reader->nodeType == XML_READER_TYPE_CDATA)) {
		my $depth = $reader->depth;
		my ($inNextState, $retval) = elementToK($reader);
		if (!$inNextState) {
			$reader->nextElement;
		}
		return $retval;
	}
	return "";
}

sub elementToK {
	my ($reader) = (@_);
	my $inNextState = 0;
	my $label = $reader->name;
	# if (exists($ignoreThese{$label})) {
		# return ($inNextState, undef);
	# }
	# my $prefix = "";
	# my $suffix = "";
	if ($label eq "Builtin") {
		return ($inNextState, builtinToK($reader));
	}
	# if ($label eq "RawString") {
		# return ($inNextState, rawStringToK($reader));
	# } elsif ($label eq "RawInt"){
		# return ($inNextState, rawIntToK($reader));
	# } elsif ($label eq "RawBase64") {
		# return ($inNextState, rawBase64ToK($reader));
	# }
	# if ($label eq 'List') {

	# } elsif ($label eq 'Identifier') {
		# $reader->nextElement;
		# my $rawData = getRawData($reader);
		# my $ident = 'Identifier' . paren($rawData);
		# my $id = $ID . paren($ident);
		# return ($inNextState, $id . paren(KLIST_IDENTITY));
	# } elsif ($label eq 'WStringLiteral') {
		# $reader->nextElement;
		# $reader->read;
		# my $str = escapeWString($reader->value);
		# my $ident = "'WStringLiteral" . paren(paren($str));
		# return ($inNextState, $ident);
	# } elsif ($label eq 'Variadic') {
		# return ($inNextState, paren("$BOOL true") . paren(KLIST_IDENTITY));
	# } elsif ($label eq 'NotVariadic') {
		# return ($inNextState, paren("$BOOL false") . paren(KLIST_IDENTITY));
	# }
	my @klist = ();
	my $depth = $reader->depth;
	$reader->nextElement;
	if ($reader->depth > $depth) {
		do {
			my $childResult = xmlToK($reader);
			if ($childResult) {
				push (@klist, $childResult);
			}
		} while ($reader->depth > $depth) # while ($reader->nextSiblingElement == 1);
	}
	$inNextState = 1;
	
	my $numElements = scalar @klist;
	if ($numElements == 0) {
		push (@klist, KLIST_IDENTITY);
	}
	my $kterm = paren(join(KLIST_SEPARATOR, @klist));
	
	# if ($label eq 'LTLAnnotation') {
		# $ltl .= "eq 'LTLAnnotation($klist[0]) = ";
		# shift (@klist);
		# $ltl .= paren(join(KLIST_SEPARATOR, @klist)) . " .\n";
		# return ($inNextState, "(.).K");
	# }
	if ($label eq 'List') {
		my $prefix = '(_`(_`)(kList("wklist_"), ';
		my $suffix = '))';
		return ($inNextState, $prefix . $kterm . $suffix);
	} else {
		return ($inNextState, nameToLabel($label, $numElements) . $kterm);
	}
	
}

# sub rawdataToK {
	# my ($reader) = (@_);
	# my $sort = $reader->getAttribute('sort');
	# if ($sort eq 'Int') { $sort = 'Rat'; }
	# my $data = getRawData($reader);
	# return "#" . paren($data) . paren(KLIST_IDENTITY);
# }

sub builtinToK {
	my ($reader) = (@_);
	$reader->read;
	my $label = $reader->name;
	if ($label eq "String") {
		return rawStringToK($reader);
	} elsif ($label eq "Base64String") {
		return rawBase64ToK($reader);
	} elsif ($label eq "Integer") {
		return rawIntToK($reader);
	}
}

sub rawStringToK {
	my ($reader) = (@_);
	$reader->read;
	my $data = $reader->value;
	return "#" . paren('"' . $data . '"') . paren(KLIST_IDENTITY);
}
sub rawIntToK {
	my ($reader) = (@_);
	$reader->read;
	my $data = $reader->value;
	return "#" . paren($data) . paren(KLIST_IDENTITY);
}
sub rawBase64ToK {
	my ($reader) = (@_);
	$reader->read;
	my $data = $reader->value;
	return "#" . paren('"' . escapeString($data) . '"') . paren(KLIST_IDENTITY);
}

# sub getRawData {
	# my ($reader) = (@_);
	# my $data = "";
	# $reader->read;
	
	# if ($sort eq 'String') {
		# $data = '"' . escapeString($reader->value) . '"';
	# } elsif ($sort eq 'Int') {
		# $data = $reader->value;
	# }  elsif ($sort eq 'Float') {
		# $data = $reader->value;
	# } else {
		# return "unknown raw data";
	# }
	# return $data;
# }


sub escapeSingleCharacter {
	my ($char) = (@_);
	
	if (exists($escapeMap{$char})) {
		return $escapeMap{$char};
	} elsif ($char =~ /[\x20-\x7E]/) {
		return $char;
	} else {
		my $ord = ord($char);
		return '\\' . sprintf("%03o", $ord) ;
	}
}

sub escapeString {
	my ($str) = (@_);
	my $decoded = decode_base64($str);
	my @charArray = split(//, $decoded);
	my @newArray = map(escapeSingleCharacter($_), @charArray) ;
	return join('', @newArray);
}


# sub escapeWString {
	# my ($str) = (@_);
	# my $decoded = decode_base64($str);
	# my $retval = '_`(_`)(kList("wklist_"), (';
	# utf8::decode($decoded);
	# my @charArray = split(//, $decoded);
	# for my $c (@charArray) {
		# utf8::encode($c);
		# my @charPartArray = split(//, $c);
		# my $single = 0;
		# for my $cp (@charPartArray) {
			# $single = ($single << 8) + ord($cp);
		# }
		# $retval .= "$RAT $single" . paren(KLIST_IDENTITY) . KLIST_SEPARATOR . " ";
	# }
	
	# $retval .= ".List{K}))";
	# return $retval;
# }

sub paren {
	my ($str) = (@_);
	return "($str)";
}