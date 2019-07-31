set names utf8;
set foreign_key_checks=0;
/*外部キー制約の無視*/

drop database if exists panther;
create database if not exists panther;
use panther;


/*会員情報テーブル*/
drop table if exists user_info;
create table user_info(
id int not null primary key auto_increment,
user_id varchar(16) not null unique,
password varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
sex tinyint default 0,
email varchar(32),
status tinyint default 0,
logined tinyint not null default 0,
regist_date datetime,
update_date datetime
);


/*商品情報テーブル*/
drop table if exists product_info;
create table product_info(
id int not null primary key auto_increment,
product_id int not null unique,
product_name varchar(100) not null unique,
product_name_kana varchar(100) not null unique,
product_description varchar(255),
category_id int not null,
price int not null,
image_file_path varchar(100) not null,
image_file_name varchar(50) not null,
release_date datetime,
release_company varchar(50),
status tinyint default 0,
regist_date datetime,
update_date datetime,
foreign key(category_id) references m_category(category_id)
);


/*カート情報テーブル*/
drop table if exists cart_info;
create table cart_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int not null,
regist_date datetime,
update_date datetime,
foreign key(product_id) references product_info(product_id)
);


/*購入履歴情報テーブル*/
drop table if exists purchase_history_info;
create table purchase_history_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int,
price int not null,
destination_id int,
regist_date datetime,
update_date datetime,
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
);


/*宛先情報テーブル*/
drop table if exists destination_info;
create table destination_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
email varchar(32),
tel_number varchar(13),
user_address varchar(50) not null,
regist_date datetime,
update_date datetime,
foreign key(user_id) references user_info(user_id)
);


/*カテゴリマスタテーブル*/
drop table if exists m_category;
create table m_category(
id int not null primary key auto_increment,
category_id int not null unique,
category_name varchar(20) not null unique,
category_description varchar(100),
regist_date datetime,
update_date datetime
);

set foreign_key_checks=1;
/*外部キー制約を戻す*/


insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());


insert into m_category values
(1,1,"全てのカテゴリー","本、家電・パソコン、おもちゃ・ゲーム全てのカテゴリーが対象となります",now(), now()),
(2,2,"本","本に関するカテゴリーが対象となります",now(),now()),
(3,3,"家電・パソコン","家電・パソコンに関するカテゴリーが対象となります",now(),now()),
(4,4,"おもちゃ・ゲーム","おもちゃ・ゲームに関するカテゴリーが対象となります",now(),now()),
(5,5,"CD","CDに関するカテゴリーが対象となります",now(),now());


insert into product_info values
( 1, 1,"すっきり分かるJava","すっきりわかるJava","すっきり分かるJavaの商品詳細",2,2800,"./images","book1.png",now(),"sophia_company",1,now(),now()),
( 2, 2,"広辞苑","こうじえん","広辞苑の商品詳細",2,9700,"./images","book2.png",now(),"sophia_company",1,now(),now()),
( 3, 3,"俺か俺以外か","おれかおれいがいか","俺か、俺以外かの商品詳細",2,1500,"./images","book3.png",now(),"sophia_company",1,now(),now()),
( 4, 4,"峯尾という人生","みねおというじんせい","峯尾という人生の商品詳細",2,100000,"./images","book4.png",now(),"sophia_company",1,now(),now()),
( 5, 5,"Classic Queen","クラシッククイーン","Classic Queenの商品詳細",2,1800,"./images","book5.png",now(),"sophia_company",1,now(),now()),
( 6,6,"スマートウォッチ","すまーとうぉっち","スマートウォッチの商品詳細",3,26000,"./images","kaden1.png",now(),"sophia_company",1,now(),now()),
( 7,7,"ドライヤー","どらいやー","ドライヤーの商品詳細",3,2980,"./images","kaden2.png",now(),"sophia_company",1,now(),now()),
( 8,8,"TV","テレビ","TVの商品詳細",3,30000,"./images","kaden3.png",now(),"sophia_company",1,now(),now()),
( 9,9,"ノートパソコン","のーとぱそこん","ノートパソコンの商品詳細",3,40000,"./images","kaden4.png",now(),"sophia_company",1,now(),now()),
( 10,10,"スマートフォン","すまーとふぉん","スマートフォンの商品詳細",3,19800,"./images","kaden5.png",now(),"sophia_company",1,now(),now()),
( 11,11,"人生ゲーム","じんせいげーむ","人生ゲームの商品詳細",4,3980,"./images","omocha1.png",now(),"sophia_company",1,now(),now()),
( 12,12,"ドンジャラ","どんじゃら","ドンジャラの商品詳細",4,2980,"./images","omocha2.png",now(),"sophia_company",1,now(),now()),
( 13,13,"遊戯王","ゆうぎおう","遊戯王の商品詳細",4,1980,"./images","omocha3.png",now(),"sophia_company",1,now(),now()),
( 14,14,"サルゲッチュ","さるげっちゅ","サルゲッチュの商品詳細",4,3000,"./images","omocha4.png",now(),"sophia_company",1,now(),now()),
( 15,15,"モンスターハンター","もんすたーはんたー","モンスターハンターの商品詳細",4,3980,"./images","omocha5.png",now(),"sophia_company",1,now(),now()),
( 16,16,"miiiiine","みーね","miiiiineの商品詳細",5,100000,"./images","CD1.png",now(),"sophia_company",1,now(),now()),
( 17,17,"バッハ","ばっは","バッハの商品詳細",5,980,"./images","CD2.png",now(),"sophia_company",1,now(),now()),
( 18,18,"シャルル","しゃるる","シャルルの商品詳細",5,28980,"./images","CD3.png",now(),"sophia_company",1,now(),now()),
( 19,19,"ヒーリングミュージック","ひーりんぐみゅーじっく","ヒーリングミュージックの商品詳細",5,890,"./images","CD4.png",now(),"sophia_company",1,now(),now()),
( 20,20,"BadGuy","ばっどがい","Bad_Guyの商品詳細",5,1280,"./images","CD5.png",now(),"sophia_company",1,now(),now());