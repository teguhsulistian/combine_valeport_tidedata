#Created By Teguh Sulistian
#PKLP_BIG 2019
#convert valeport format to geotide input and merge all file

# remove header 
ls -d *.TXT | sed -e 's/.TXT//g'| sed -e 's/\.\.//g' | sed -e 's/\///g' > filename.txt
for name in `cat filename.txt`; do
	awk 'NR<24{s=s ORS $0;next} NR==5{print $0 s;next} 1' ${name}.TXT > ${name}filter.dat
done
# merge all .dat file to one file
ls -d *.dat | sed -e 's/.dat//g'| sed -e 's/\.\.//g' | sed -e 's/\///g' > filedat.txt
for name in `cat filedat.txt`; do
	cat ${name}.dat >> plot_all.txt
done
