CREATE TABLE [dbo].[FactSurveyResponse](
	[SurveyResponseKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[ProductSubcategoryKey] [int] NOT NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_FactSurveyResponse_SurveyResponseKey] PRIMARY KEY CLUSTERED 
(
	[SurveyResponseKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO