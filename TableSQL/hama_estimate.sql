--���̺� ����
drop table estimate;

--����������
drop sequence estimate_estimate_id_seq;

create table estimate (
    estimate_id      number(10), -- pk,
    board_id           number(10), -- requestBoard ���̺��� �ܷ�Ű,
    member_id        number(10), -- member ���̺��� �ܷ�Ű,       -- �ø��ɹ����̵�
    work_member_id   number(10),     -- �ϸ��� ���̵�
    esti_gubun      varchar2(10) not null, --������ �ۼ��� �� ���� �ð� �� ����
    esti_price      varchar2(20) not null,   --������ �ۼ��� ����
    esti_text       varchar2(300),
    esti_file      BLOB,         --������ �ۼ��� ����
    cdate               timestamp default systimestamp,         --�����Ͻ�
    udate               timestamp default systimestamp          --�����Ͻ�
 ); 
 
--�⺻Ű����
alter table estimate add Constraint estimate_estimate_id_pk primary key (estimate_id);

--�ܷ�Ű����
alter table estimate add constraint estimate_board_id_fk foreign key(board_id) references requestBoard(board_id);
alter table estimate add constraint estimate_member_id_fk foreign key(member_id) references member(member_id);
alter table estimate add constraint estimate_member_id_fk foreign key(work_member_id) references member(work_member_id);

--������
create sequence estimate_estimate_id_seq;

--���õ����� of estimate
insert into estimate (estimate_id, board_id ,member_id, work_member_id, esti_gubun, esti_price, esti_text)
    values(estimate_estimate_id_seq.nextval, 1, 1, 1,'�� ���', '3,000', '���ص帮�ڽ��ϴ�!');
insert into estimate (estimate_id, board_id ,member_id, work_member_id, esti_gubun, esti_price, esti_text)
    values(estimate_estimate_id_seq.nextval, 2, 2, 2,'�ð� ��', '9,000', '����������!');

select * from estimate;
commit;