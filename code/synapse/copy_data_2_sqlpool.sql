CREATE TABLE simple_table
(
    [Correlation id] [varchar](200) NULL,
	[Operation name] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Event category] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [datetime] NULL,
	[Subscription] [varchar](200) NULL,
	[Event initiated by] [varchar](1000) NULL,
	[Resource type] [varchar](1000) NULL,
	[Resource group] [varchar](1000) NULL,
  [Resource] [varchar](2000) NULL)

COPY INTO dbo.simple_table FROM 'https://arnold970924.blob.core.windows.net/csv/QueryResult.csv'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL=(IDENTITY= 'Storage Account Key', SECRET='LLl7LRsFJB2Ik0b0UeXPer1ku9ErA0F8/xN1oi6EiXekkmICC01SV2qEYgURDKw+ASt51JoWw=='),
    FIRSTROW=2)

SELECT * from simple_table
