#!/bin/bash

awk '{new_line=""; prev_is_en=0;
    for(i=1;i<=NF;i++){
        if($i~/[a-zA-Z0-9]/){
            if(prev_is_en==1)
                $i=" "$i;
            else
                prev_is_en=1
        }
        else
            prev_is_en=0;
        new_line=new_line$i;
    }
    printf "%s\n", new_line
}' $1 > $2
