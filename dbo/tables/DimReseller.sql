CREATE TABLE [dbo].[DimReseller](
	[ResellerKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[ResellerAlternateKey] [nvarchar](15) NULL,
	[Phone] [nvarchar](25) NULL,
	[BusinessType] [varchar](20) NOT NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NULL,
	[OrderFrequency] [char](1) NULL,
	[OrderMonth] [tinyint] NULL,
	[FirstOrderYear] [int] NULL,
	[LastOrderYear] [int] NULL,
	[ProductLine] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[AnnualSales] [money] NULL,
	[BankName] [nvarchar](50) NULL,
	[MinPaymentType] [tinyint] NULL,
	[MinPaymentAmount] [money] NULL,
	[AnnualRevenue] [money] NULL,
	[YearOpened] [int] NULL,
 CONSTRAINT [PK_DimReseller_ResellerKey] PRIMARY KEY CLUSTERED 
(
	[ResellerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimReseller_ResellerAlternateKey] UNIQUE NONCLUSTERED 
(
	[ResellerAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]