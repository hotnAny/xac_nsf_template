pgs=9
ref=2
sup=3

let pgsend=1+$pgs

let refst=$pgsend+1
let refend=$pgsend+$ref

let fac=$refend+1

let data=$fac+1

let supst=$data+1
let supend=$data+$sup

pdfjam -q --paper letterpaper $1.pdf 1 -o $1_project_summary.pdf         
pdftotext -layout $1_project_summary.pdf - | awk '/^ +/{print "\n"} {printf "%s ",$$0}' >  $1_text_summary.txt
pdfjam -q --paper letterpaper $1.pdf 2-$pgsend -o $1_project_description.pdf   
pdfjam -q --paper letterpaper $1.pdf $refst-$refend -o $1_references.pdf            
pdfjam -q --paper letterpaper $1.pdf $fac -o $1_facilities.pdf             
pdfjam -q --paper letterpaper $1.pdf $data -o $1_data_management.pdf        
pdfjam -q --paper letterpaper $1.pdf $supst-$supend -o $1_supplemental.pdf        

