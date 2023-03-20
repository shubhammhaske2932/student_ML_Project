from pyspark import SparkConf,SparkContext

cfo = SparkConf().setMaster("local").setAppName("myFirstApp")
sc = SparkContext(conf = cfo)

rddobj1 = sc.parallelize(["Tom","Fiona","John","Sam","Bob"])
print (rddobj1.collect())
print ('Total items in rdd1: ',rddobj1.count())

#python filename.py
#spark-submit filename.py
