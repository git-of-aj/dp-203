CREATE table log (
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

SELECT * from LOG

CREATE table parquet_log (
    [Correlation_id] [varchar](200) NULL,
	[Operation_name] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Event_category] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [datetime] NULL,
	[Subscription] [varchar](200) NULL,
	[Event_initiated_by] [varchar](1000) NULL,
	[Resource_type] [varchar](1000) NULL,
	[Resource_group] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)

DROP TABLE parquet_log

    SELECT * from parquet_log
