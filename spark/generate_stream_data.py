from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StringType, IntegerType

# Criação da sessão Spark
spark = SparkSession.builder \
    .appName("LibraryCheckoutsStreaming") \
    .getOrCreate()

# Definição do schema manualmente (porque CSV não tem schema garantido)
schema = StructType() \
    .add("title", StringType()) \
    .add("isbn", StringType()) \
    .add("publisher", StringType()) \
    .add("subjects", StringType()) \
    .add("itemtype", StringType()) \
    .add("checkoutyear", IntegerType()) \
    .add("checkoutmonth", IntegerType()) \
    .add("materialtype", StringType()) \
    .add("collection", StringType()) \
    .add("checkoutdate", StringType())

# Ler o streaming de ficheiros que vão aparecendo
df = spark.readStream \
    .option("sep", ",") \
    .schema(schema) \
    .csv("streaming/input/")  # Aqui é onde o teu script vai gerar pequenos CSVs

# Processar: Agrupar por ano e contar quantos checkouts há
agg_df = df.groupBy("checkoutyear").count()

# Escrever para console (modo 'complete' atualiza tudo a cada microbatch)
query = agg_df.writeStream \
    .outputMode("complete") \
    .format("console") \
    .option("truncate", "false") \
    .start()

query.awaitTermination()
