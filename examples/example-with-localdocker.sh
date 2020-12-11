./main.nf -profile localdocker \
	--runtime_opts "-e SPARK_LOCAL_DIRS=/tmp -e SPARK_WORKER_LOG=$PWD/local -v $PWD/local:$PWD/local" \
	--workers 1 \
	--spark_log_dir $PWD/local \
	--app_jar $PWD/local/app.jar \
	--app_main org.janelia.colormipsearch.cmd.SparkMainEntry \
	--app_args \
	"searchLocalFiles, \
	-m,$PWD/local/testData/masks/ch2ch_2_mask.png, \
	-i,$PWD/local/testData/flyem/766255970_RT_18U_FL-02_CDM.tif, \
    --mirrorMask, \
    --xyShift,2, \
    --pctPositivePixels,2, \
    --pixColorFluctuation,1, \
    -od $PWD/local/testData/cdsresults.test"