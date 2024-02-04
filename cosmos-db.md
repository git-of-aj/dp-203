> compitive advantage == how well you use the data ?
# basics
- Account (API - NoSQL, Gremlin etc) => DB
- A database is simply a group of containers.
- An Azure Cosmos DB container is where data is stored.
- Azure Cosmos DB scales out. Data is stored on one or more servers, called partitions.
![](https://learn.microsoft.com/en-us/azure/cosmos-db/media/account-databases-containers-items/cosmos-entities.png)

# Microsoft Fabric
> It brings together the best of Microsoft Power BI, Azure Synapse, and Azure Data Factory into one unified software as a service (SaaS) platform. 
- [MS DOCS](https://learn.microsoft.com/en-us/fabric/get-started/microsoft-fabric-overview)
- [Labs](https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/01-lakehouse.html)
- SaaS data lake = onelake = almost like onedrive
- akehouse provides highly scalable file storage in a OneLake store (built on Azure Data Lake Store Gen2) with a metastore for relational objects such as tables and views based on the open source Delta Lake table format.(versioned Parquet file) 
- [video announcement](https://build.microsoft.com/en-US/sessions/852ccf38-b07d-4ddc-a9fe-2e57bdaeb613?source=sessions)

# Slide - 4 
## Data analytics 
[what is data analytics](https://aws.amazon.com/what-is/data-analytics)

# Decision Trees
- [Data Store](https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-decision-tree)
- [SSIS vs ADF](https://learn.microsoft.com/en-us/azure/architecture/data-guide/technology-choices/pipeline-orchestration-data-movement)

------------------------------------------------------

# All services Together
1. Basic Pipeline
![]([https://learn.microsoft.com/en-us/azure/architecture/solution-ideas/articles/ingest-etl-stream-with-adb](https://learn.microsoft.com/en-us/azure/architecture/solution-ideas/media/ingest-etl-and-stream-processing-with-azure-databricks.svg))

2. Little advanced
![](https://learn.microsoft.com/en-us/azure/architecture/solution-ideas/media/azure-databricks-modern-analytics-architecture.svg)

Certainly! Let's design a real-world architecture using Azure Synapse Analytics, HDInsight, and Azure Databricks for a comprehensive retail sales analytics solution.

**Retail Sales Analytics Architecture:**

1. **Data Ingestion:**
   - Raw data from various sources such as point-of-sale systems, online transactions, and social media is ingested into Azure Data Lake Storage (ADLS) or Azure Blob Storage.
   - Azure Synapse Analytics is used for structured data ingestion and ETL (Extract, Transform, Load) processes. It can handle structured sales data, process it, and load it into dedicated data warehouse tables.

2. **Data Processing with HDInsight:**
   - Unstructured or semi-structured data, such as clickstream data, customer reviews, and social media interactions, is processed using Azure HDInsight.
   - Apache Spark on HDInsight can be employed for distributed data processing and analysis, allowing for the identification of patterns and trends in customer behavior. This processed data can be stored back in ADLS or Azure Blob Storage.

3. **Advanced Analytics with Azure Databricks:**
   - Azure Databricks is utilized for advanced analytics and machine learning. Data scientists and analysts work in a collaborative Databricks workspace to build and deploy machine learning models.
   - Databricks notebooks can be used to create and experiment with machine learning algorithms for demand forecasting, customer segmentation, and recommendation systems.

4. **Data Orchestration and Pipelines:**
   - Azure Data Factory can be employed for orchestrating and scheduling data pipelines that move and transform data between different services. It helps automate the end-to-end data workflow.
   - Data Factory can orchestrate the execution of ETL processes in Azure Synapse Analytics, run Spark jobs on HDInsight, and trigger machine learning workflows in Azure Databricks.

5. **Data Visualization and Reporting:**
   - Power BI can be integrated to connect to Azure Synapse Analytics for structured data reporting. It can create interactive dashboards and reports based on the insights derived from the structured sales data.
   - Additionally, the results from advanced analytics and machine learning models developed in Databricks can be visualized in Power BI, providing a unified view of insights from both structured and unstructured data.

6. **Scalability and Flexibility:**
   - Azure Synapse Analytics provides scalability for structured data processing with the ability to provision resources based on demand.
   - HDInsight allows flexibility for processing large-scale unstructured or semi-structured data using open-source big data frameworks.
   - Azure Databricks provides a scalable and collaborative environment for developing and deploying advanced analytics and machine learning models.

This architecture leverages the strengths of each service, ensuring that the retail company can efficiently process, analyze, and derive insights from both structured and unstructured data, while also benefiting from the scalability and flexibility of the Azure cloud platform.
