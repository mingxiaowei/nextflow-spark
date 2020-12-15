./main.nf -profile localsingularity \
	--runtime_opts "-B $PWD/local:$PWD/local" \
	--workers 3 \
	--worker_cores 3 \
	--gb_per_core 6 \
	--driver_cores 1 \
	--driver_memory 2g \
	--driver_logconfig $PWD/examples/spark-conf/log4j.properties \
	--spark_conf $PWD/examples/spark-conf \
	--spark_work_dir "$PWD/local" \
	--app "$PWD/local/app.jar" \
	--app_main org.janelia.colormipsearch.cmd.SparkMainEntry \
	--app_args \
	"searchFromJSON, \
	-m,$PWD/local/testData/mask-2.json, \
	-i,$PWD/local/testData/sgal4Targets.json, \
        --mirrorMask, \
        --maskThreshold,30, \
        --dataThreshold,30, \
        --xyShift,2, \
        --pctPositivePixels,2, \
        --pixColorFluctuation,2, \
        -od $PWD/local/testData/cdsresults.test"
