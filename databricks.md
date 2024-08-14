https://learn.microsoft.com/en-us/azure/databricks/introduction/

- [Ms learn modules - 4 part](https://learn.microsoft.com/en-us/training/paths/data-engineer-azure-databricks/)

- [project video](https://youtu.be/pMqnvXgPKlI?feature=shared)

- https://www.databricks.com/blog/2021/03/25/its-time-to-re-evaluate-your-relationship-with-hadoop.html

## databricks
1. https://aws.amazon.com/what-is/apache-spark/
2. https://www.databricks.com/glossary/what-are-dataframes
3. https://docs.databricks.com/en/dbfs/index.html
4. https://docs.databricks.com/en/files/index.html
5. https://docs.databricks.com/en/catalogs/index.html
6. https://docs.databricks.com/en/_extras/notebooks/source/unity-catalog-volumes.html

```py
movie = spark.read.format("csv").option("header", "true").load("dbfs:/FileStore/shared_uploads/ananaywfhintellify@gmail.com/movies-1.csv")
# df1.show()
# display(movie)

df2 = movie.filter("Genre == 'Comedy'")
filtered_movie = spark.sql("select Film from movies where year < 2009")
display(filtered_movie)

# df.filter(df.age > 3).show()
# filter for less complicated filtering 
via_filter = df2.filter(df2.year < 2009).show
```
