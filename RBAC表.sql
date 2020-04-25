
--��֯��
create table tbl_organzation(
       pk_org_id number primary key not null,       --��id
       org_parent_id number not null,               --����
       org_name varchar(64) not null,               --��֯����
       org_create_time date not null,               --����ʱ��
       org_desription varchar(1024) not null        --��֯����
)
-----------------------------------------------------------------

--�û���
create table tbl_user(
       pk_user_id number primary key not null,    --��¼��ʶid
       fk_org_id number not null,                 --������֯id
       constraint fk_user_organzation foreign key(fk_org_id)
       references tbl_organzation(pk_org_id), 
       login_name varchar(64) not null,           --��½�˺�
       user_password varchar(64) not null,        --�û�����
       tel_number number not null,                --�û�����
       email varchar(64) not null,                --�绰����
       user_create_time date not null,            --�����ʼ�
       login_time date not null,                  --��½ʱ��
       last_login_time date not null,             --�ϴε�½ʱ��
       login_count number not null                --��½����
)
-------------------------------------------------------------
--��ɫ��
create table tbl_role(
       pk_role_id number primary key not null,    --��ɫid
       parent_role_id number not null,            --������ɫid
       role_name varchar(64) not null,            --��ɫ����
       role_create_time date not null,            --����ʱ��
       role_description varchar(1024)             --��ɫ����
)
  
----------------------------------------------------------------

--Ȩ�ޱ�
create table tbl_right(
       pk_right_id number primary key not null,   --Ȩ��id
       parent_right_id varchar(64) not null,      --��Ȩ��id
       right_name varchar(64) not null,           --Ȩ������
       right_description varchar(1024)            --Ȩ������
)
------------------------------------------------------------------

--���
create table tbl_group(
       pk_group_id number primary key not null,   --��id
       group_name varchar(64) not null,           --������
       parent_group_id number not null,           --����id
       group_create_time date not null,           --����ʱ��
       group_decription varchar(1024)             --������
)
------------------------------------------------------------------

--��ɫȨ�ޱ�
create table tbl_role_right(
       pk_rri_id number primary key not null,     --��¼id
       fk_role_id number not null,                --��ɫid
       constraint fk_roleright_role foreign key(fk_role_id)
       references tbl_role(pk_role_id),
       fk_right_id number not null,               --Ȩ��id
       constraint fk_rolerright_right foreign key(fk_right_id)
       references tbl_right(pk_right_id),
       right_type int not null                    --��������
       ) 
-------------------------------------------------------------------

--��Ȩ�ޱ�
create table tbl_group_right(
       pk_gri_id number primary key not null,     --��¼��ʶ
       fk_group_id number not null,               --��
       constraint fk_groupright_group foreign key(fk_group_id)
       references tbl_group(pk_group_id),
       fk_right_id number not null,               --Ȩ��
       constraint fk_groupright_right foreign key(fk_right_id)
       references tbl_right(pk_right_id),
       ck_right_type char(1) not null check(ck_right_type in ('�ɷ���','����Ȩ'))              --Ȩ������
       
)
--------------------------------------------------------------------

--���ɫ��
create table tbl_group_role(
       pk_gro_id number primary key not null,     --��¼��ʶ
       fk_group_id number not null,               --��
       constraint fk_grouprole_group foreign key(fk_group_id)
       references tbl_group(pk_group_id),
       fk_role_id number not null                 --��ɫ
)
-----------------------------------------------------------------

--�û�Ȩ�ޱ�
create table tbl_user_right(
       pk_uri_id number primary key not null,     --��¼��ʶid
       fk_user_id number not null,                --�û�
       constraint fk_userright_user foreign key(fk_user_id)
       references tbl_user(pk_user_id),            
       fk_right_id number not null,               --Ȩ��
       constraint fk_userright_right foreign key(fk_right_id)
       references tbl_right(pk_right_id),
       ck_right_type char(1) not null check(ck_right_type in ('�ɷ���','����Ȩ')) --Ȩ������
) 
-------------------------------------------------------------------

--�û���ɫ��
create table tbl_user_role(
       pk_uro_id number primary key not null,       --��¼��ʶid
       fk_user_id number not null,                  --�û�
       constraint fk_userrole_user foreign key(fk_user_id)
       references tbl_user(pk_user_id),            
       fk_role_id number not null,                   --��ɫ
       constraint fk_userrole_role foreign key(fk_role_id)
       references tbl_role(pk_role_id)
)
---------------------------------------------------------------

--�û����
create table tbl_user_group(
       pk_urg_id number primary key not null,       --��¼��ʶid
       fk_user_id number not null,                  --�û�
       constraint fk_usergroup_user foreign key(fk_user_id)
       references tbl_user(pk_user_id),
       fk_group_id number not null,                  --��
       constraint fk_usergroup_group foreign key(fk_group_id)
       references tbl_group(pk_group_id)
)
-------------------------------------------------------------------



--������־��
create table tbl_log(
       pk_log_id number primary key not null,       --��¼��ʶid
       log_op_type int not null,                    --��������
       fk_role_id number not null,                  --��ɫ
       constraint fk_log_role foreign key(fk_role_id)
       references tbl_role(pk_role_id),
       op_content varchar(1024) not null,           --��������
       fk_org_id number not null,                   --������
       constraint fk_rogorg_organzation foreign key(fk_org_id)
       references tbl_organzation(pk_org_id),
       op_time date not null                        --����ʱ��
  )
------------------------------------------------------------------------------    
