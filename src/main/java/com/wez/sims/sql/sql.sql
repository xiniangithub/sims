show tables;

-- 学生表
create table t_student (
	stuId int primary key auto_increment comment '学号',
	stuName varchar(10) comment '学生姓名',
	gender varchar(1) comment '性别',
	birthday date comment '出生年月', 
	tel varchar(11) comment '联系电话',
	email varchar(50) comment '邮箱'	
) auto_increment=100001;

-- 课程表
create table t_course (
	courseId int primary key auto_increment comment '课程号',
	courseName varchar(10) comment '课程名',
	credit smallint comment '学分',
	classHour smallint comment '课时'
) auto_increment=200001;

-- 选课表
create table t_select_course (
	scId int primary key auto_increment comment '选课表ID',
	stuId int comment '学生号',
	courseId int comment '课程号'
) auto_increment=300001;

select * from t_student;