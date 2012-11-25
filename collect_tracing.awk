BEGIN { 
    FS=" ";
    count = 0;
}
{ if ($0 ~ /\/\//) {
    if($2 == "print" ) {
            prints[count++] = $3
        }
    }
}
END {
    cmd = "sed '/start/ a FILE *"prints[0]"=fopen(\""prints[0]"\",\"w\");' "ARGV[1]" | sed '/end/ a fclose("prints[0]");'" 

   for (i = 1; i< count; i++) {
        cmd =cmd " | sed '/start/ a FILE *"prints[i]"=fopen(\""prints[i]"\",\"w\");' | sed '/end/ a fclose("prints[i]");'" 
    }
    
    #cmd = cmd " > " ARGV[1] ".tmp"
    system(cmd)
}
