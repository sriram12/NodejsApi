/****** Object:  Table [dbo].[login_history]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL,
	[ip_address] [nvarchar](50) NULL,
	[system_details] [nvarchar](max) NULL,
	[login_date] [datetime] NULL,
 CONSTRAINT [PK_login_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[registration_types]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[registration_type_name] [nvarchar](50) NULL,
	[description] [nvarchar](250) NULL,
	[create_date] [datetime] NULL CONSTRAINT [DF_registration_types_create_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_registration_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [nvarchar](50) NULL CONSTRAINT [DF_Table_1_RoleId]  DEFAULT (newid()),
	[role_name] [nvarchar](100) NULL,
	[role_description] [nvarchar](500) NULL,
	[is_active] [bit] NULL CONSTRAINT [DF_Table_1_IsActive]  DEFAULT ((1)),
	[created_on] [datetime] NULL CONSTRAINT [DF_Table_1_CreatedOn]  DEFAULT (getdate()),
	[updated_on] [datetime] NULL CONSTRAINT [DF_Table_1_UpdatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[created_on] [datetime] NULL CONSTRAINT [DF_Test_created_on]  DEFAULT (getdate()),
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL CONSTRAINT [DF_Users_user_id]  DEFAULT (newid()),
	[email_id] [nvarchar](100) NULL,
	[mobile_number] [nvarchar](50) NULL,
	[social_media_profile_id] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[is_active] [bit] NULL CONSTRAINT [DF_Users_is_active]  DEFAULT ((1)),
	[is_blocked] [bit] NULL CONSTRAINT [DF_Users_is_blocked]  DEFAULT ((0)),
	[is_deleted] [bit] NULL CONSTRAINT [DF_users_is_deleted]  DEFAULT ((0)),
	[registration_type_id] [bigint] NULL,
	[last_login_date] [datetime] NULL CONSTRAINT [DF_Table_1_last_login_date]  DEFAULT (getdate()),
	[token] [nvarchar](max) NULL DEFAULT (''),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_basic_details]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_basic_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL,
	[first_name] [nvarchar](100) NULL,
	[middle_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[email_id] [nvarchar](100) NULL,
	[mobile_number] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL CONSTRAINT [DF_Users_Basic_Details_registration_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_Users_Basic_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_in_roles]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_in_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL,
	[role_id] [nvarchar](50) NULL,
	[created_on] [datetime] NULL CONSTRAINT [DF_UsersInRoles_created_on]  DEFAULT (getdate()),
	[updated_on] [datetime] NULL CONSTRAINT [DF_UsersInRoles_updated_on]  DEFAULT (getdate()),
 CONSTRAINT [PK_UsersInRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_otp]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_otp](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](250) NULL,
	[otp_code] [nvarchar](10) NULL,
	[create_date] [datetime] NULL CONSTRAINT [DF_users_otp_create_date]  DEFAULT (getdate()),
	[otp_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_users_otp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[registration_types] ON 

GO
INSERT [dbo].[registration_types] ([id], [registration_type_name], [description], [create_date]) VALUES (1, N'username_password', N'Using username & password', CAST(N'2019-11-08 14:25:51.930' AS DateTime))
GO
INSERT [dbo].[registration_types] ([id], [registration_type_name], [description], [create_date]) VALUES (2, N'mobile_email_otp', N'Using mobile/email & OTP', CAST(N'2019-11-08 14:25:51.940' AS DateTime))
GO
INSERT [dbo].[registration_types] ([id], [registration_type_name], [description], [create_date]) VALUES (3, N'social_profile', N'Using social media profiles', CAST(N'2019-11-08 14:25:51.940' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[registration_types] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

GO
INSERT [dbo].[roles] ([id], [role_id], [role_name], [role_description], [is_active], [created_on], [updated_on]) VALUES (1, N'99D868EC-A91E-4F79-B514-D1CB83DAD987', N'Administrator', N'Administrator', 1, CAST(N'2019-10-30 16:59:58.030' AS DateTime), CAST(N'2019-10-30 16:59:58.030' AS DateTime))
GO
INSERT [dbo].[roles] ([id], [role_id], [role_name], [role_description], [is_active], [created_on], [updated_on]) VALUES (2, N'29C4CE79-A7F3-4C69-9CF5-51C64B52168B', N'User', N'User', 1, CAST(N'2019-10-30 16:59:58.030' AS DateTime), CAST(N'2019-10-30 16:59:58.030' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

GO
INSERT [dbo].[Test] ([id], [name], [email], [created_on]) VALUES (1, N'Sonu Sharma', N'sonu@gmrwebteam.com', CAST(N'2019-10-30 13:20:47.853' AS DateTime))
GO
INSERT [dbo].[Test] ([id], [name], [email], [created_on]) VALUES (2, N'Sriram Kumar', N'sriram@gmrwebteam.com', CAST(N'2019-10-30 13:20:47.857' AS DateTime))
GO
INSERT [dbo].[Test] ([id], [name], [email], [created_on]) VALUES (3, N'Amarjeet Kumar', N'amarjeet@gmrwebteam.com', CAST(N'2019-10-30 13:20:47.857' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

GO
INSERT [dbo].[users] ([id], [user_id], [email_id], [mobile_number], [social_media_profile_id], [password], [is_active], [is_blocked], [is_deleted], [registration_type_id], [last_login_date], [token]) VALUES (1, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'test@test.com', N'+917857045962', N'', N'', 1, 0, 0, 2, CAST(N'2019-11-08 20:38:10.613' AS DateTime), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNDdCREQxNTktRjBDRS00RjVFLTgxMzktMEMyOUQ2RThEOERDIiwicm9sZV9pZCI6IjI5QzRDRTc5LUE3RjMtNEM2OS05Q0Y1LTUxQzY0QjUyMTY4QiIsInJvbGVfbmFtZSI6IlVzZXIiLCJuYW1lIjoiU29udSBLdW1hciIsImVtYWlsX2lkIjoidGVzdEB0ZXN0LmNvbSIsIm1vYmlsZV9udW1iZXIiOiIrOTE3ODU3MDQ1OTYyIiwiZ2VuZGVyIjoiIiwicmVnaXN0cmF0aW9uX2RhdGUiOiIyMDE5LTExLTA4VDIwOjM4OjEwLjYxN1oiLCJpYXQiOjE1NzM0NzY2NjJ9.9ar9GFrS1u1X_88T4IiFFXcoWv0moIY0rF3Mmtac8VE')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[users_basic_details] ON 

GO
INSERT [dbo].[users_basic_details] ([id], [user_id], [first_name], [middle_name], [last_name], [email_id], [mobile_number], [gender], [registration_date]) VALUES (1, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'Sonu Kumar', NULL, NULL, N'test@test.com', N'+917857045962', N'', CAST(N'2019-11-08 20:38:10.617' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[users_basic_details] OFF
GO
SET IDENTITY_INSERT [dbo].[users_in_roles] ON 

GO
INSERT [dbo].[users_in_roles] ([id], [user_id], [role_id], [created_on], [updated_on]) VALUES (1, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'29C4CE79-A7F3-4C69-9CF5-51C64B52168B', CAST(N'2019-11-08 20:38:10.613' AS DateTime), CAST(N'2019-11-08 20:38:10.613' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[users_in_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users_otp] ON 

GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (1, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'927252', CAST(N'2019-11-08 20:38:10.660' AS DateTime), N'register')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (2, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'446695', CAST(N'2019-11-08 21:29:43.103' AS DateTime), N'register')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (3, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'387389', CAST(N'2019-11-08 21:35:15.947' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (4, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'933665', CAST(N'2019-11-08 21:37:00.133' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (5, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'643879', CAST(N'2019-11-08 21:38:34.890' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (6, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'397158', CAST(N'2019-11-08 21:39:19.763' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (7, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'548060', CAST(N'2019-11-11 18:15:10.337' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (8, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'885364', CAST(N'2019-11-11 18:16:20.173' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (9, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'231476', CAST(N'2019-11-11 18:17:52.333' AS DateTime), N'login')
GO
INSERT [dbo].[users_otp] ([id], [user_id], [otp_code], [create_date], [otp_type]) VALUES (10, N'47BDD159-F0CE-4F5E-8139-0C29D6E8D8DC', N'754142', CAST(N'2019-11-11 18:19:32.203' AS DateTime), N'login')
GO
SET IDENTITY_INSERT [dbo].[users_otp] OFF
GO
ALTER TABLE [dbo].[login_history] ADD  CONSTRAINT [DF_login_history_login_date]  DEFAULT (getdate()) FOR [login_date]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllTestData]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_GetAllTestData]
As
Begin
	Select * From Test
	Order By created_on
End
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTestDataById]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_GetTestDataById]
@id bigint
As
Begin
	Select * From Test
	Where id = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserDetailsByUserId]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetUserDetailsByUserId]
@user_id nvarchar(250)
As
Begin
	
	Select u.[user_id], r.role_id, r.role_name, ubd.first_name as name, ubd.email_id, ubd.mobile_number, ubd.gender, ubd.registration_date
	From users u
	INNER JOIN users_basic_details ubd ON u.user_id = ubd.user_id
	INNER JOIN users_in_roles uir ON u.user_id = uir.user_id
	INNER JOIN roles r ON uir.role_id = r.role_id
	Where u.is_deleted = 0 AND u.is_active = 1 AND u.is_blocked = 0
	AND u.user_id = @user_id
	
End


GO
/****** Object:  StoredProcedure [dbo].[usp_RegisterUser]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_RegisterUser]
@user_id nvarchar(50) OUTPUT,
@output_message nvarchar(250) OUTPUT,
@registration_type nvarchar(50),
@name nvarchar(100),
@email nvarchar(100),
@mobile nvarchar(100),
@password nvarchar(250),
@social_media_profile_id nvarchar(250),
@gender nvarchar(50) = '',
@roleid nvarchar(250) = '',
@is_active bit = 0
As
Begin

	SET @user_id = '';
	SET @output_message = '';
	DECLARE @registration_type_id bigint = 0;
	Select @registration_type_id = id From registration_types Where registration_type_name = @registration_type
	
	IF @registration_type = 'username_password'
		Begin

			IF EXISTS(Select id From users Where email_id = @email AND is_deleted = 0 AND registration_type_id = @registration_type_id)
				Begin
					SET @output_message = 'This email is already registered';
					SET @user_id = '';
				End
			ELSE
				Begin

					INSERT INTO users(email_id, mobile_number, social_media_profile_id, password, is_active, registration_type_id)
					VALUES (@email, @mobile, @social_media_profile_id, @password, @is_active, @registration_type_id)

					SET @output_message = '';
					Select @user_id = [user_id] From users Where email_id = @email AND is_deleted = 0 AND registration_type_id = @registration_type_id

					INSERT INTO users_in_roles([user_id], role_id) VALUES (@user_id, @roleid)

					INSERT INTO users_basic_details([user_id], first_name, email_id, mobile_number, gender) 
					VALUES (@user_id, @name, @email, @mobile, @gender)
					
				End

		End
	ELSE IF @registration_type = 'mobile_email_otp'
		Begin

			IF EXISTS(Select id From users Where mobile_number = @mobile AND is_deleted = 0 AND registration_type_id = @registration_type_id)
				Begin
					SET @output_message = 'This mobile number is already registered';
					--Select @user_id = [user_id] From users Where mobile_number = @mobile AND is_deleted = 0 AND registration_type_id = @registration_type_id
					SET @user_id = '';
				End
			ELSE
				Begin

					INSERT INTO users(email_id, mobile_number, social_media_profile_id, password, is_active, registration_type_id)
					VALUES (@email, @mobile, @social_media_profile_id, @password, @is_active, @registration_type_id)

					SET @output_message = '';
					Select @user_id = [user_id] From users Where mobile_number = @mobile AND is_deleted = 0 AND registration_type_id = @registration_type_id

					INSERT INTO users_in_roles([user_id], role_id) VALUES (@user_id, @roleid)

					INSERT INTO users_basic_details([user_id], first_name, email_id, mobile_number, gender) 
					VALUES (@user_id, @name, @email, @mobile, @gender)
					
				End

		End
	ELSE IF @registration_type = 'social_profile'
		Begin

			IF EXISTS(Select id From users Where social_media_profile_id = @social_media_profile_id AND is_deleted = 0 AND registration_type_id = @registration_type_id)
				Begin
					SET @output_message = 'This social media profile is already registered';
					Select @user_id = [user_id] From users Where social_media_profile_id = @social_media_profile_id AND is_deleted = 0 AND registration_type_id = @registration_type_id
				End
			ELSE
				Begin

					INSERT INTO users(email_id, mobile_number, social_media_profile_id, password, is_active, registration_type_id)
					VALUES (@email, @mobile, @social_media_profile_id, @password, @is_active, @registration_type_id)

					SET @output_message = '';
					Select @user_id = [user_id] From users Where mobile_number = @mobile AND is_deleted = 0 AND registration_type_id = @registration_type_id

					INSERT INTO users_in_roles([user_id], role_id) VALUES (@user_id, @roleid)

					INSERT INTO users_basic_details([user_id], first_name, email_id, mobile_number, gender) 
					VALUES (@user_id, @name, @email, @mobile, @gender)
					
				End

		End
	ELSE 
		Begin
			Set @output_message = 'Invalid registration type';
		End

End



GO
/****** Object:  StoredProcedure [dbo].[usp_SaveOTP]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_SaveOTP]
@id bigint OUTPUT,
@user_id nvarchar(50),
@otp_code nvarchar(10),
@otp_type nvarchar(50)
As
Begin
	
	SET @id = 0;
	
	INSERT INTO users_otp([user_id], otp_code, otp_type) 
	VALUES (@user_id, @otp_code, @otp_type)

	SELECT @id = IDENT_CURRENT('users_otp')

End
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveToken]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_SaveToken]
@user_id nvarchar(50),
@token nvarchar(max)
As
Begin

	Update users set token = @token where user_id = @user_id

End
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateUser]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ValidateUser]
@user_id nvarchar(50) OUTPUT,
@output_message nvarchar(250) OUTPUT,
@login_type nvarchar(50),
@email nvarchar(100),
@mobile nvarchar(100),
@password nvarchar(250),
@social_media_profile_id nvarchar(250)
As
Begin

	SET @user_id = '';
	SET @output_message = '';
	DECLARE @registration_type_id bigint = 0;
	Select @registration_type_id = id From registration_types Where registration_type_name = @login_type
	
	IF @login_type = 'username_password'
		Begin

			IF EXISTS(Select id From users Where email_id = @email AND password = @password AND is_deleted = 0 AND registration_type_id = @registration_type_id AND is_blocked = 0 AND is_active = 1)
				Begin
					SET @output_message = '';
					Select @user_id = [user_id] From users Where email_id = @email AND password = @password 
					AND is_deleted = 0 AND registration_type_id = @registration_type_id AND is_blocked = 0 AND is_active = 1
				End
			ELSE
				Begin

					SET @output_message = 'Username or password is invalid';
					SET @user_id = '';
					
				End

		End
	ELSE IF @login_type = 'mobile_email_otp'
		Begin

			IF EXISTS(Select id From users Where mobile_number = @mobile AND is_deleted = 0 AND registration_type_id = @registration_type_id AND is_blocked = 0 AND is_active = 1)
				Begin
					SET @output_message = '';
					Select @user_id = [user_id] From users Where mobile_number = @mobile AND is_deleted = 0 AND registration_type_id = @registration_type_id AND is_blocked = 0 AND is_active = 1
				End
			ELSE
				Begin

					SET @output_message = 'This mobile number is not registered with us';
					SET @user_id = '';
					
				End

		End
	ELSE IF @login_type = 'social_profile'
		Begin

			IF EXISTS(Select id From users Where social_media_profile_id = @social_media_profile_id AND is_deleted = 0 AND registration_type_id = @registration_type_id AND is_blocked = 0 AND is_active = 1)
				Begin
					SET @output_message = '';
					Select @user_id = [user_id] From users Where social_media_profile_id = @social_media_profile_id AND is_deleted = 0 AND registration_type_id = @registration_type_id 
					AND is_blocked = 0 AND is_active = 1
				End
			ELSE
				Begin

					SET @output_message = 'This social media profile is not registered with us';
					SET @user_id = '';
					
				End

		End
	ELSE 
		Begin
			Set @output_message = 'Invalid login type';
		End

End



GO
/****** Object:  StoredProcedure [dbo].[usp_VerifyOTP]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_VerifyOTP]
@result nvarchar(50) OUTPUT,
@user_id nvarchar(50),
@otp_code nvarchar(10),
@otp_type nvarchar(50)
As
Begin
	
	SET @result = '';
	
	IF EXISTS(Select * From users_otp Where [user_id] = @user_id AND otp_code = @otp_code AND otp_type = @otp_type AND create_date >= DATEADD(minute,-5,GETDATE()))
		Begin
			SET @result = 'verified';
		End

End



GO
/****** Object:  StoredProcedure [dbo].[usp_VerifyToken]    Script Date: 11/11/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_VerifyToken]
@user_id nvarchar(50),
@token nvarchar(max)
As
Begin
	Select id, isnull([user_id], '') as [user_id] from users where token = @token and user_id = @user_id
End
GO