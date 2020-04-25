
--���������
create table tbl_adm_class(
pk_adm_class_no char(6) primary key not null, --ѧ��
dpt char(4) check (dpt in ('�ƿ�','��Ժ','���')) not null  --ϵ��
)
-----------------------------------------------------------------------------------

--�γ̱�
create table tbl_course(
  pk_crs_no int check(pk_crs_no = 4) primary key not null,    --�γ̱��
  crs_name varchar(20) check (crs_name <=10) not null,             --�γ���
  crs_cdt smallint check(crs_cdt>=1 and crs_hour<=5)not null,                 --ѧ��
  crs_hour smallint check(crs_hour in ('16','32','64')) not null,                --ѧʱ
  crs_type char(1) check(crs_type in ('רҵ���޿�','רҵѡ�޿�','�������޿�','����ѡ�޿�'))   --�γ���� 
);
-------------------------------------------------------------------------------------

--ѧ����
create table tbl_student(
  pk_stu_no int primary key check(pk_stu_no = 6) not null,   --ѧ��
  stu_name varchar(50) not null,                              --����
  stu_sex char(1)   check(stu_sex in ('Ů','��')) not null��  --�Ա�
  stu_gdu varchar(30) not null,                               --��ҵѧУ
  stu_bth date not null,                                      --��������
  stu_id char(18) not null,                                   --���֤��
  stu_tel int check(stu_tel=11) not null,                               --��ϵ�绰
  stu_pol char(1) check(stu_pol in ('Ⱥ��','������ί','�뵳��������','��Ա')),--������ò
  fk_adm_class_no int check(fk_adm_class_no = 6) not null,                           --�����༶
  stu_reg varchar(50) not null,                               --����
  ck_stu_sta char(1) check(ck_stu_sta in ('�����','δ���')) not null,  --ѧҵ���
  ck_stu_pwd varchar(30) check(ck_stu_pwd>=2 and ck_stu_pwd<=8) not null,--���룿����                      
  constraint fk_student_admclass foreign key(fk_adm_class_no)
  references tbl_adm_class(pk_adm_class_no)    
   );    
----------------------------------------------------------------------------------

--��ʦ��
create table tbl_teacher (
  pk_tea_no int primary key check (pk_tea_no = 4) not null,                                          --����
  tea_name varchar(50) not null,                                               --����
  tea_sex char(1) check(tea_sex in ('Ů','��')),                               --�Ա�
  tea_acd char(1) check(tea_acd in ('����','˶ʿ','��ʿ')),  --ѧ��
  tea_title char(1) check(tea_title in ('��ʦ','������','����')),     --ְ��
  tea_bth date not null,                                                        --��������
  tea_id char(18) unique not null,                                              --���֤��
  tea_tel int check(tea_tel = 11) not null,                                                 --��ϵ�绰
  tea_pol char(1) check(tea_pol in ('��Ա','������Ա')),                        --������ò
  fk_dpt char(4) not null,                                                      --ϵ��
  tea_reg varchar(50) not null,                                                 --����
  tea_wkt date not null,                                                        --����ʱ��
  ck_tea_pwd varchar(30) check (ck_tea_pwd>=2 and ck_tea_pwd<=8) not null    --����???
);
------------------------------------------------------------------------------------------

--����Ա��
create table tbl_admin(
  pk_account varchar(10) primary key not null��  --����Ա�˺�
  fk_tea_no int unique not null,                 --����
  entitled int not null,                         --��������ԱȨ��
  ck_password varchar(30) not null 
  check (ck_password >= 2 and ck_password <=8), --����???
  constraint fk_admin_teacher foreign key (fk_tea_no)
  references tbl_teacher(pk_tea_no)); 
-------------------------------------------------------------------------------------------

--�пα�
create table tbl_crs_class(
   pk_crs_class_no int primary key not null
   check(pk_crs_class_no = 8),    --�пΰ༶���
   fk_crs_no char(4) not null,                   --�γ̱��
   fk_tea_no int  not null,                      --����
   class_term char(1) check(class_term in ('2018-2019���һѧ���','2018-2019��ڶ�ѧ���','2019-2020���һѧ���','2019-2020��ڶ�ѧ���'))not null,    --ѧ��
   class_time varchar(30) not null,             --�ڿ�ʱ��
   class_place varchar(20) not null,            --�ڿεص�
  constraint fk_crsclass_course foreign key(fk_crs_no)
  references tbl_course(pk_crs_no),
  constraint fk_crsclass_teacher foreign key(fk_tea_no)
  references tbl_teacher(pk_tea_no)
);
----------------------------------------------------------------------------------------------

--�пΰ༶Ⱥ��
create table tbl_stu_class(
pk_stu_no int primary key not null, --ѧ��
fk_crs_class_no int check(fk_crs_class_no = 8) not null,      --�пΰ༶���       
grade smallint check(grade>=0 and grade <= 100) not null,                  --�ɼ�  
constraint fk_stuclass_crsclass foreign key(fk_crs_class_no)  
references tbl_crs_class(pk_crs_class_no)
);
------------------------------------------------------------------------------------------------

