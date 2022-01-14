select count(*) from menu;

 select *
  from (
   select A.*, rownum as rn 
   from (
      select m.num, m.name,m.menu_detail, m.Classification,c.count
        from menu m,menu_count c
        where m.name = c.name and c.vol='tall'
        order by num
  ) A
)
where rn between 1 and 20;

select m.num, m.name,m.menu_detail, m.Classification,c.count
from menu m,menu_count c
where m.name = c.name and c.vol='tall'
order by num;
--
drop table menu;
drop table menu_information;
drop table menu_count;

-- 메뉴테이블
create table menu( --메뉴테이블
num Number not null primary key, -- 메뉴번호
name varchar2(100) UNIQUE,--메뉴이름
menu_detail varchar2(4000), --메뉴설명
Classification varchar2(50) --메뉴분류
);
select * from menu;
delete from menu;

insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'아메리카노','깔끔하고 상큼함이 특징인 커피','coffee');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'카라멜 마키아또','향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료','coffee');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'카푸치노','풍부하고 진한 에스프레소에 따뜻한 우유와 벨벳 같은 우유 거품이 1:1 비율로 어우러져 마무리된 커피 음료','coffee');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'카페 라떼','풍부하고 진한 에스프레소가 신선한 스팀 밀크를 만나 부드러워진 커피 위에 우유 거품을 살짝 얹은 대표적인 커피 라떼','coffee');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'에스프레소',' 향기로운 크레마 층과 바디 층, 하트 층으로 이루어져 있으며, 입안 가득히 커피와 달콤한 카라멜 향이 느껴지는 커피 음료','coffee');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'피치 레몬 블렌디드','복숭아와 레몬, 말랑한 복숭아 젤리가 조화로운 과일 블렌디드','blended');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'딸기 딜라이트 요거트 블렌디드','유산균이 살아있는 리얼 요거트와 풍성한 딸기 과육이 더욱 상큼하게 어우러진 과일 요거트 블렌디드','blended');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'뉴이어 시트러스 티','새로운 한 해를 맞이하며 마음의 평화를 찾고 싶을 때 즐기는 이너피스 컨셉의 티. 마음의 안정을 주는 레몬그라스와 다양한 시트러스 풍미의 과일, 유스베리 티가 어우러진 티 베리에이션 음료','tea');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'라임 패션 티','새콤달콤한 히비스커스와 라임의 이국적인 조화가 매력적인 라임 패션 티','tea');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'자몽 허니 블랙 티','새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 스타벅스 티바나 블랙 티의 조화','tea');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'유스베리 티','제주산 유기농 찻잎으로 만든 황차에 사과, 망고, 파인애플, 히비스커스, 로즈힙 등이 블렌딩되어 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 옐로우 티','tea');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'블랙 티 레모네이드 피지오','진하게 우린 블랙 티와 상큼한 레모네이드를 더한 청량감 있는 음료입니다. 목 넘김이 좋은 가벼운 탄산이 첨가되어 깔끔하게 즐길 수 있습니다.','Fizzio');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'쿨 라임 피지오','그린 빈 추출액이 들어간 라임 베이스에 건조된 라임 슬라이스를 넣고 스파클링한 시원하고 청량감 있는 음료입니다. (카페인이 함유된 탄산음료입니다)','Fizzio');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'더블 에스프레소 칩 프라푸치노','리스트레토 에스프레소 2샷과 에스프레소 칩, 하프앤하프가 진하게 어우러진 커피의 기본에 충실한 프라푸치노','Frappuccino');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'자바 칩 프라푸치노','커피, 모카 소스, 진한 초콜릿 칩이 입안 가득 느껴지는 스타벅스에서만 맛볼 수 있는 프라푸치노','Frappuccino');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'제주 유기농 말차로 만든 크림 프라푸치노','깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 프라푸치노','Frappuccino');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'딸기 가득 요거트 190ML','상큼 달콤 딸기 과육이 한가득 씹히는 마시는 요거트 음료','bottle drink');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'한라봉주스 190ML','새콤달콤한 황금빛 제주 한라봉을 그대로 담아낸 주스','bottle drink');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'토마토주스 190ML','국내산 토마토의 풍성한 과육이 듬뿍 담겨있는 주스 우유','bottle drink');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'스팀 우유','따뜻한 우유','etc');
insert into menu(num,name,menu_detail,Classification) values((select nvl(max(num)+1,1) from menu),'시그니처 초콜릿','깊고 진한 초콜릿과 부드러운 휘핑크림이 입안에서 사르르 녹는 프리미엄 초콜릿 음료','etc');

select * from menu;

--메뉴영양정보 테이블
create table menu_information(
name varchar2(50) references menu(name), --메뉴이름(외래키)
vol varchar2(50), --메뉴 사이즈(용량)
kcal NUMBER, --칼로리
natrium Number, --나트륨 
fat number, --포화지방
sugar number, --당류
protein number, --단백질
Caffeine number --카페인
);


insert into menu_information(name,vol,kcal,natrium,fat,sugar,protein,Caffeine) values('아메리카노','tall',5,10,0,0,0,140);
insert into menu_information(name,vol,kcal,natrium,fat,sugar,protein,Caffeine) values('아메리카노','grande',15,10,0,0,0,225);
insert into menu_information(name,vol,kcal,natrium,fat,sugar,protein,Caffeine) values('아메리카노','venti',5,25,0,0,0,300);
insert into menu_information(name,vol,kcal,natrium,fat,sugar,protein,Caffeine) values('카라멜 마키아또','tall',200,130,5,22,8,75);

commit; 

select * from menu_information;

-- join문 
select *
from menu,menu_information
where menu.name=menu_information.name;

-- (메뉴크기에 따라 달라지는 )가격테이블 
create table menu_count(
name varchar2(100) references menu(name), --메뉴이름 
vol varchar2(50), --메뉴 사이즈(용량)
count Number -- 메뉴 가격
);

delete from menu_count;

insert into menu_count(name,vol,count) values('아메리카노','tall',4100);
insert into menu_count(name,vol,count) values('아메리카노','grande',4600);
insert into menu_count(name,vol,count) values('아메리카노','venti',5100);
insert into menu_count(name,vol,count) values('카라멜 마키아또','tall',5600);
insert into menu_count(name,vol,count) values('카라멜 마키아또','grande',6100);
insert into menu_count(name,vol,count) values('카라멜 마키아또','venti',6600);
insert into menu_count(name,vol,count) values('카푸치노','tall',4600);
insert into menu_count(name,vol,count) values('카푸치노','grande',5100);
insert into menu_count(name,vol,count) values('카푸치노','venti',5600);
insert into menu_count(name,vol,count) values('카페 라떼','tall',4600);
insert into menu_count(name,vol,count) values('카페 라떼','grande',5100);
insert into menu_count(name,vol,count) values('카페 라떼','venti',5600);
insert into menu_count(name,vol,count) values('에스프레소','tall',3600);
insert into menu_count(name,vol,count) values('에스프레소','grande',4100);
insert into menu_count(name,vol,count) values('에스프레소','venti',4600);
insert into menu_count(name,vol,count) values('피치 레몬 블렌디드','tall',6100);
insert into menu_count(name,vol,count) values('피치 레몬 블렌디드','grande',6600);
insert into menu_count(name,vol,count) values('피치 레몬 블렌디드','venti',7100);
insert into menu_count(name,vol,count) values('딸기 딜라이트 요거트 블렌디드','tall',6100);
insert into menu_count(name,vol,count) values('딸기 딜라이트 요거트 블렌디드','grande',6600);
insert into menu_count(name,vol,count) values('딸기 딜라이트 요거트 블렌디드','venti',7100);
insert into menu_count(name,vol,count) values('뉴이어 시트러스 티','tall',6100);
insert into menu_count(name,vol,count) values('뉴이어 시트러스 티','grande',6600);
insert into menu_count(name,vol,count) values('뉴이어 시트러스 티','venti',7100);
insert into menu_count(name,vol,count) values('라임 패션 티','tall',5600);
insert into menu_count(name,vol,count) values('라임 패션 티','grande',6100);
insert into menu_count(name,vol,count) values('라임 패션 티','venti',6600);
insert into menu_count(name,vol,count) values('자몽 허니 블랙 티','tall',5300);
insert into menu_count(name,vol,count) values('자몽 허니 블랙 티','grande',5800);
insert into menu_count(name,vol,count) values('자몽 허니 블랙 티','venti',6300);
insert into menu_count(name,vol,count) values('유스베리 티','tall',4100);
insert into menu_count(name,vol,count) values('유스베리 티','grande',4600);
insert into menu_count(name,vol,count) values('유스베리 티','venti',5100);
insert into menu_count(name,vol,count) values('블랙 티 레모네이드 피지오','tall',5400);
insert into menu_count(name,vol,count) values('블랙 티 레모네이드 피지오','grande',5900);
insert into menu_count(name,vol,count) values('블랙 티 레모네이드 피지오','venti',6400);
insert into menu_count(name,vol,count) values('쿨 라임 피지오','tall',5900);
insert into menu_count(name,vol,count) values('쿨 라임 피지오','grande',6400);
insert into menu_count(name,vol,count) values('쿨 라임 피지오','venti',6900);
insert into menu_count(name,vol,count) values('더블 에스프레소 칩 프라푸치노','tall',6100);
insert into menu_count(name,vol,count) values('더블 에스프레소 칩 프라푸치노','grande',6600);
insert into menu_count(name,vol,count) values('더블 에스프레소 칩 프라푸치노','venti',7100);
insert into menu_count(name,vol,count) values('자바 칩 프라푸치노','tall',6100);
insert into menu_count(name,vol,count) values('자바 칩 프라푸치노','grande',6600);
insert into menu_count(name,vol,count) values('자바 칩 프라푸치노','venti',7100);
insert into menu_count(name,vol,count) values('제주 유기농 말차로 만든 크림 프라푸치노','tall',6100);
insert into menu_count(name,vol,count) values('제주 유기농 말차로 만든 크림 프라푸치노','grande',6600);
insert into menu_count(name,vol,count) values('제주 유기농 말차로 만든 크림 프라푸치노','venti',7100);
insert into menu_count(name,vol,count) values('딸기 가득 요거트 190ML','tall',4500);
insert into menu_count(name,vol,count) values('한라봉주스 190ML','tall',4500);
insert into menu_count(name,vol,count) values('토마토주스 190ML','tall',4500);
insert into menu_count(name,vol,count) values('스팀 우유','tall',4100);
insert into menu_count(name,vol,count) values('스팀 우유','short',3600);
insert into menu_count(name,vol,count) values('시그니처 초콜릿','short',4800);
insert into menu_count(name,vol,count) values('시그니처 초콜릿','tall',5300);
insert into menu_count(name,vol,count) values('시그니처 초콜릿','grande',5800);
insert into menu_count(name,vol,count) values('시그니처 초콜릿','venti',6300);

commit; 
-- join문 
select *
from menu,menu_count
where menu.name=menu_count.name;

select * from menu;

--create view menu_view 
--as select *
--from menu m,menu_count c,menu_infromation i
--where m.name=c.name and m.name=i.name;

create view menu_view as
select m.num as num ,m.name as name ,m.menu_detail as menu_detail ,m.classification as classification ,
    c.count as count ,c.vol as vol ,nvl(i.caffeine,0) as caffeine ,nvl(i.fat,0) as fat,nvl(i.kcal,0) as kcal,nvl(i.natrium,0) as natrium,nvl(i.protein,0) as protein,nvl(i.sugar,0) as sugar
from menu m left join menu_count c on m.name=c.name
left join menu_information i on (m.name=i.name and c.vol=i.vol)
order by m.num; 

drop view menu_view;

select * from menu_view;
commit;

 select * from menu_view 
 where name='아메리카노' and vol='tall';

commit;

select * from member; 

 select passwd from member 
 where userid='kim12345' and email='1234@naver.com';
-- 사용자 정보 테이블 
create table member (
userid varchar2(50) not null primary key, -- 유저아이디
passwd varchar2(50) not null, --페스워드
name varchar2(50) not null UNIQUE, --닉네임
tel varchar2(50), --전화번호
email varchar2(50), --이메일
join_date date default sysdate, --가입일자
birth_date date --생년월일
);

-- insert into member(userid,passwd,name,tel,email) values('kim1234','qwqwQW12!@','홍길동','01000000000','1234@naver.com');
select userid from member where userid='kim1234';
commit;
-- 사용자의 주문내역 테이블
create table order_menu( --주문내역테이블
order_num Number not null primary key, -- 주문순서 
name varchar2(50), --메뉴이름
vol varchar2(50), --메뉴 사이즈(용량)
count Number, -- 메뉴 가격
temp varchar2(50), -- 핫/아이스 
cup varchar2(50), -- 개인컵/일회용,매장컵 
userid varchar2(50) references member(userid)-- 유저아이디 
);

commit;