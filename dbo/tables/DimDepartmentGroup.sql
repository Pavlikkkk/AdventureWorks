CREATE TABLE [dbo].[DimDepartmentGroup](
	[DepartmentGroupKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentDepartmentGroupKey] [int] NULL,
	[DepartmentGroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimDepartmentGroup] PRIMARY KEY CLUSTERED 
(
	[DepartmentGroupKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO