#enable pdf mode
$pdf_mode = 1;
$recorder = 1;
$pdflatex = 'pdflatex --shell-escape -interaction nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';

#add synctex extensions so they are cleaned
push @generated_exts, 'synctex', 'synctex.gz';

#custom file dependencies
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('sbn', 'sbl', 0, 'run_makeglossaries');
add_cus_dep('idn', 'idl', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}

#add generated extensions so they are cleaned correctly
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'sbn', 'sbl', 'syml';
push @generated_exts, 'idn', 'idl', 'indx';
$clean_ext .= ' %R.ist %R.xdy';

add_cus_dep('svg', 'pdf_tex', 0, 'svg2pdf_tex');
sub svg2pdf_tex {
   return system("inkscape -z -C --export-latex --export-pdf=\"$_[0].pdf\" --file=\"$_[0].svg\"");
}
add_cus_dep('svg', 'pdf', 0, 'svg2pdf');
sub svg2pdf{
   return system("inkscape -z -C --export-pdf=\"$_[0].pdf\" \"$_[0].svg\"");
}
add_cus_dep('png', 'eps', 0, 'png2eps');
sub png2eps {
	return system("convert -compress zip \"$_[0].png\" eos2:\"$_[0].eps\"");
}
