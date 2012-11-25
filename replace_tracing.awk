BEGIN { 
    FS=" " 
}
{ if ($0 ~ /\/\//) {
    if($2 == "print" ) {
        print "printf(\"%d\\n\"," $3 ");"
    }
}
else {
    print $0
    }
} 
