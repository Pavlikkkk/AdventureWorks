CREATE TABLE [dbo].[FactAdditionalInternationalProductDescription](
	[ProductKey] [int] NOT NULL,
	[CultureName] [nvarchar](50) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FactAdditionalInternationalProductDescription_ProductKey_CultureName] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC,
	[CultureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO