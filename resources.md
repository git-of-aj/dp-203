- [git-repo-withgood-diagrams and free resources](https://github.com/Amrit-Hub/How-to-become-Data-Engineering-Essentials)
- [Sample Data sets of Udemy Insatructor](https://github.com/dgadiraju/data)

# My Own 
[Databricks Project - check heading Databricks Project](https://github.com/Trainer-AJ/data-engineering-code/blob/main/databricks/Day2.ipynb)

## data Pipelines 
[AWS](https://aws.amazon.com/what-is/data-pipeline)
- [more detailed](https://www.datacamp.com/tutorial/introduction-to-data-pipelines-for-data-professionals)
# Rough TOC
[ADF Intro](https://learn.microsoft.com/en-us/training/modules/data-integration-azure-data-factory/)
- [Check this for Full ADF - MS leanr Module](https://learn.microsoft.com/en-us/training/paths/data-integration-scale-azure-data-factory/)
- [databricks inside ADF](https://learn.microsoft.com/en-us/training/modules/run-azure-databricks-notebooks-azure-data-factory/)
1. intro
2. linked service and dataset
3. activities
4. functions and parameters
5. self hosted IR vm =>sql srv express =>expresssetup of ir
7. ADF ==> pvt endpoint <=> SQL server [adf portal => left side manage => pvt endpoint]
8. Git integration
-----------------------
```json
 "data": [
    {
      "id": 7,
      "email": "michael.lawson@reqres.in",
      "first_name": "Michael",
      "last_name": "Lawson",
      "avatar": "https://reqres.in/img/faces/7-image.jpg"
    },
    {
      "id": 8,
      "email": "lindsay.ferguson@reqres.in",
      "first_name": "Lindsay",
      "last_name": "Ferguson",
      "avatar": "https://reqres.in/img/faces/8-image.jpg"
    },
   
```

SO under ADF => `Mapping` ==> `Collection Refernce` => Copy paste what you see below `$['data']`
- filename `@concat(utNOw('mm'),'-',utcNow('hh'),'.csv')` ==> BTW last time I didn't use .csv 
- COpy to Sql insert => auto create new table 

## databricks 
[data lakehouse analytics solution with Azure Databricks](https://learn.microsoft.com/en-us/training/paths/data-engineer-azure-databricks/)

## synapse 
- [pipeline](https://learn.microsoft.com/en-us/training/paths/transfer-transform-data-azure-synapse-analytics-pipelines/)
- [DWH in synapse](https://learn.microsoft.com/en-us/training/paths/work-with-data-warehouses-using-azure-synapse-analytics/)
- [All features of synapse](https://learn.microsoft.com/en-us/training/paths/implement-data-analytics-azure-synapse-analytics/)

## Fabric
[dp-600](https://learn.microsoft.com/en-us/credentials/certifications/fabric-analytics-engineer-associate/?practice-assessment-type=certification)
[Data fctory in Synapse](https://learn.microsoft.com/en-us/training/modules/use-data-factory-pipelines-fabric/)
