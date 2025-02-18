USE [tiles shopee]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[card_name] [varchar](50) NULL,
	[card_number] [varchar](50) NULL,
	[expiry_month] [int] NULL,
	[expiry_year] [int] NULL,
	[cvv_no] [int] NULL,
	[client_id] [varchar](50) NULL,
	[payment_mode] [varchar](50) NULL,
 CONSTRAINT [PK_payment_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admin_login]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_login](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_admin_login] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contact_us]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contact_us](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[subject] [varchar](50) NULL,
	[message] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_contact_us] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_gst]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_gst](
	[g_id] [int] IDENTITY(1,1) NOT NULL,
	[gst_code] [varchar](50) NULL,
	[cgst] [varchar](50) NULL,
	[sgst] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_gst] PRIMARY KEY CLUSTERED 
(
	[g_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_location]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_members]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[aadhar_no] [varchar](50) NULL,
	[ration_card] [varchar](50) NULL,
	[mobile] [int] NULL,
 CONSTRAINT [PK_tbl_members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_more_members]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_more_members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[mobile] [varchar](50) NULL,
	[aadhar_no] [varchar](50) NULL,
	[ration_no] [varchar](50) NULL,
	[user_id] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_more_members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[unit_type] [varchar](50) NULL,
	[sale_price] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[image_url] [varchar](50) NULL,
	[product_name] [varchar](50) NULL,
	[gst_code] [int] NULL,
 CONSTRAINT [PK_tbl_product_1] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_purchase_order]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_purchase_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NULL,
	[date] [varchar](50) NULL,
	[total_amount] [varchar](50) NULL,
	[gst_amount] [varchar](50) NULL,
	[Final_amount] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_purchase_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_purchase_order_item_details]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_purchase_order_item_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[purchase_order_id] [varchar](50) NULL,
	[product_id] [int] NULL,
	[quantity] [varchar](50) NULL,
	[rate] [varchar](50) NULL,
	[gst_amount] [varchar](50) NULL,
	[total] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_purchase_order_item_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_raw_product]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_raw_product](
	[r_p_id] [int] IDENTITY(1,1) NOT NULL,
	[raw_item_name] [varchar](50) NULL,
	[raw_unit_type] [varchar](50) NULL,
	[raw_category_price] [varchar](50) NULL,
	[raw_gst_code] [varchar](50) NULL,
	[raw_description] [varchar](max) NULL,
	[raw_sale_price] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_raw_product] PRIMARY KEY CLUSTERED 
(
	[r_p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_schedule_distribution]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_schedule_distribution](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[rate] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[location] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_schedule_distribution] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_supplier_details]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_supplier_details](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[pin_code] [varchar](50) NULL,
	[mobile_no] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_supplier_details] PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_unit]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_unit](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_unit] PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_orders]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](50) NULL,
	[product_id] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[total_price] [varchar](50) NULL,
	[GST_amount] [varchar](50) NULL,
	[final_amount] [varchar](50) NULL,
	[order_date] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_user_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_warehouse]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_warehouse](
	[w_id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_warehouse] PRIMARY KEY CLUSTERED 
(
	[w_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_warehouse_stock]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_warehouse_stock](
	[w_s_id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_id] [int] NULL,
	[product_id] [int] NULL,
	[total_quantity] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_warehouse_stock] PRIMARY KEY CLUSTERED 
(
	[w_s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_details]    Script Date: 14-03-2024 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[mobile_no] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_user_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[payment_details] ON 

INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (1, N'kaustubh hirve', N'1234567891234567', 4, 2033, 321, N'yash@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (2, N'kaustubh hirve', N'9876543211234567', 2, 2029, 123, N'yash@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (3, N'dev tiwari', N'1234567891234567', 5, 2025, 123, N'yash@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (4, N'dev tiwari', N'1234567891234567', 5, 2025, 123, N'yash@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (5, N'vinit singh', N'411111111111', 1, 2024, 123, N'yash@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (6, N'vinit singh', N'4111111111111', 1, 2024, 123, N'yash@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (7, N'vinit singh', N'411111111111', 2, 2027, 123, N'ok@gmail.com', N'Debit / Credit')
INSERT [dbo].[payment_details] ([id], [card_name], [card_number], [expiry_month], [expiry_year], [cvv_no], [client_id], [payment_mode]) VALUES (8, N'demo demo demo', N'1234567891234567', 4, 2024, 321, N'demo@gmail.com', N'Debit / Credit')
SET IDENTITY_INSERT [dbo].[payment_details] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_login] ON 

INSERT [dbo].[tbl_admin_login] ([a_id], [email], [password]) VALUES (1, N'admin@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[tbl_admin_login] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([c_id], [category_name]) VALUES (1, N'Sugar')
INSERT [dbo].[tbl_category] ([c_id], [category_name]) VALUES (2, N'Wheat')
INSERT [dbo].[tbl_category] ([c_id], [category_name]) VALUES (3, N'Rice')
INSERT [dbo].[tbl_category] ([c_id], [category_name]) VALUES (4, N'Daal')
INSERT [dbo].[tbl_category] ([c_id], [category_name]) VALUES (5, N'Salt')
INSERT [dbo].[tbl_category] ([c_id], [category_name]) VALUES (6, N'Everest')
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_contact_us] ON 

INSERT [dbo].[tbl_contact_us] ([id], [name], [email], [subject], [message]) VALUES (1, N'Yash', N'yash123@gmail.com', N'subject', N'message')
INSERT [dbo].[tbl_contact_us] ([id], [name], [email], [subject], [message]) VALUES (2, N'demo name', N'demo@gmail.com', N'this is demo subject', N'this is demo message')
SET IDENTITY_INSERT [dbo].[tbl_contact_us] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_gst] ON 

INSERT [dbo].[tbl_gst] ([g_id], [gst_code], [cgst], [sgst]) VALUES (1, N'GST234567', N'2', N'2')
SET IDENTITY_INSERT [dbo].[tbl_gst] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_location] ON 

INSERT [dbo].[tbl_location] ([id], [location_name]) VALUES (1, N'Virar East')
INSERT [dbo].[tbl_location] ([id], [location_name]) VALUES (2, N'Nalasopara West')
SET IDENTITY_INSERT [dbo].[tbl_location] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_members] ON 

INSERT [dbo].[tbl_members] ([id], [first_name], [last_name], [email], [address], [aadhar_no], [ration_card], [mobile]) VALUES (1, N'kaustubh', N'hirve', N'kaustubh@gmail.com', N'test address 2', N'1234567890', N'254881', 1234567890)
SET IDENTITY_INSERT [dbo].[tbl_members] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([p_id], [unit_type], [sale_price], [category], [quantity], [description], [image_url], [product_name], [gst_code]) VALUES (1, N'1', N'2500', N'1', N'50', N'An Beautifully Designed Luxury Washroom Tiles', N'tilesimg6.jpg', N'LUXURY WASHROOM TILE', 1)
INSERT [dbo].[tbl_product] ([p_id], [unit_type], [sale_price], [category], [quantity], [description], [image_url], [product_name], [gst_code]) VALUES (2, N'1', N'2750', N'2', N'50', N'An Beautifully Designed Aesthetic Washroom Tiles', N'tilesimg7.jpg', N'AESTHETIC WASHROOM TILE', 1)
INSERT [dbo].[tbl_product] ([p_id], [unit_type], [sale_price], [category], [quantity], [description], [image_url], [product_name], [gst_code]) VALUES (3, N'4', N'10000', N'1', N'50', N'An Beautifully Designed Vintage Washroom Tiles', N'tilesimg5.jpg', N'VINTAGE WASHROOM TILE', 1)
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_purchase_order] ON 

INSERT [dbo].[tbl_purchase_order] ([id], [supplier_id], [date], [total_amount], [gst_amount], [Final_amount]) VALUES (4, 1, N'14-03-2022', N'10000', N'1900', N'2950')
SET IDENTITY_INSERT [dbo].[tbl_purchase_order] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_schedule_distribution] ON 

INSERT [dbo].[tbl_schedule_distribution] ([id], [product_id], [rate], [date], [time], [location]) VALUES (1, 1, N'2500', N'19/04/2022', N'10:00 am to 1:00 pm', N'Nalasopara West')
INSERT [dbo].[tbl_schedule_distribution] ([id], [product_id], [rate], [date], [time], [location]) VALUES (2, 2, N'2750', N'20/04/2022', N'1:00pm to 6:00pm', N'Virar East')
SET IDENTITY_INSERT [dbo].[tbl_schedule_distribution] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_supplier_details] ON 

INSERT [dbo].[tbl_supplier_details] ([s_id], [name], [email], [address], [pin_code], [mobile_no]) VALUES (1, N'Sunder', N'example@gmail.com', N'Virar', N'000000', N'9999999999')
INSERT [dbo].[tbl_supplier_details] ([s_id], [name], [email], [address], [pin_code], [mobile_no]) VALUES (2, N'abc', N'abc@gmail.com', N'Vasai', N'303401', N'1234567890')
SET IDENTITY_INSERT [dbo].[tbl_supplier_details] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_unit] ON 

INSERT [dbo].[tbl_unit] ([u_id], [unit_name]) VALUES (1, N'kg')
INSERT [dbo].[tbl_unit] ([u_id], [unit_name]) VALUES (2, N'litre')
INSERT [dbo].[tbl_unit] ([u_id], [unit_name]) VALUES (3, N'g')
INSERT [dbo].[tbl_unit] ([u_id], [unit_name]) VALUES (4, N'mg')
SET IDENTITY_INSERT [dbo].[tbl_unit] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user_orders] ON 

INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (1, N'2', N'5', N'1', N'15', N'2', N'17', N'23-03-2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (2, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Canceled')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (3, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (4, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (5, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (6, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (7, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (8, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Canceled')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (9, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (10, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (11, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (12, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (13, N'1', N'1', N'1', N'40', N'0', N'40', N'4/7/2022', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (14, N'1', N'2', N'1', N'2750', N'110', N'2860', N'27-03-2023', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (15, N'2', N'2', N'1', N'2750', N'110', N'2860', N'28-03-2023', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (16, N'2', N'1', N'2', N'5000', N'200', N'5200', N'28-03-2023', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (17, N'2', N'1', N'1', N'2500', N'100', N'2600', N'28-03-2023', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (18, N'3', N'1', N'2', N'5000', N'200', N'5200', N'28-03-2023', N'Order Placed')
INSERT [dbo].[tbl_user_orders] ([id], [user_id], [product_id], [quantity], [total_price], [GST_amount], [final_amount], [order_date], [Status]) VALUES (19, N'3', N'2', N'1', N'2750', N'110', N'2860', N'28-03-2023', N'Order Placed')
SET IDENTITY_INSERT [dbo].[tbl_user_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[user_details] ON 

INSERT [dbo].[user_details] ([id], [name], [address], [gender], [email], [mobile_no], [password]) VALUES (1, N'prathamesh', N'virar', N'Male', N'yash@gmail.com', N'8765452356', N'123')
INSERT [dbo].[user_details] ([id], [name], [address], [gender], [email], [mobile_no], [password]) VALUES (2, N'ok', N'ok', N'Male', N'ok@gmail.com', N'7897897890', N'123456')
INSERT [dbo].[user_details] ([id], [name], [address], [gender], [email], [mobile_no], [password]) VALUES (3, N'demo', N'demo at demo west', N'Male', N'demo@gmail.com', N'123456789', N'123456')
SET IDENTITY_INSERT [dbo].[user_details] OFF
GO
ALTER TABLE [dbo].[tbl_user_orders] ADD  CONSTRAINT [DF_tbl_user_orders_Status]  DEFAULT ('Order Placed') FOR [Status]
GO
