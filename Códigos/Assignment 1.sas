Data mpi_national;
LENGTH Country$ 42 ISO$ 3  MPIUrban 8 HeadcountRatioUrban 8 IntensityofDeprivationUrban 8 MPIRural 8 HeadcountRatioRural 8 IntensityofDeprivationRural 8 diff 8;
INFILE '/home/u49285826/sasuser.v94/MPI_national (1).csv' FIRSTOBS=2 DSD MISSOVER;
input ISO$ Country$	MPIUrban	HeadcountRatioUrban IntensityofDeprivationUrban MPIRural HeadcountRatioRural IntensityofDeprivationRural;

diff = sum(MPIUrban-MPIRural);

if ISO = 'NIG' then ISO = 'NGA';

together = catx(',',Country,ISO);

run; 

proc print data=mpi_national;
where IntensityofDeprivationRural >= 40;
run;

