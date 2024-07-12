

commit;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    users VARCHAR(100) NOT NULL
);

create TABLE publishers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    publisher VARCHAR(100) NOT NULL
);

CREATE TABLE genre (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(100) NOT NULL
);

CREATE TABLE keywords (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    keyword VARCHAR(100) NOT NULL,
    genre_id INT UNSIGNED,
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE novels (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    users_id INT UNSIGNED,
    publisher_id INT UNSIGNED,
    price SMALLINT UNSIGNED,
    ing VARCHAR(50),
    author VARCHAR(100),
    genre_id INT UNSIGNED,
    viewCount BIGINT UNSIGNED,
    reviewCount BIGINT UNSIGNED,
    score FLOAT,
    uploaded INT UNSIGNED,
    date DATE,
    free_info TINYINT UNSIGNED,
    keywords JSON,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

commit;

-- publishers 값 insert 코드
INSERT INTO publishers (publisher) VALUES ('로크미디어');
INSERT INTO publishers (publisher) VALUES ('코핀커뮤니케이션즈');
INSERT INTO publishers (publisher) VALUES ('다소다미디어');
INSERT INTO publishers (publisher) VALUES ('라온이앤엠');
INSERT INTO publishers (publisher) VALUES ('현나라');
INSERT INTO publishers (publisher) VALUES ('래이니북스');
INSERT INTO publishers (publisher) VALUES ('라이크노벨');
INSERT INTO publishers (publisher) VALUES ('문피아');
INSERT INTO publishers (publisher) VALUES ('넥스트레벨스튜디오');
INSERT INTO publishers (publisher) VALUES ('kwbooks');
INSERT INTO publishers (publisher) VALUES ('필연매니지먼트');
INSERT INTO publishers (publisher) VALUES ('폴링인북스');
INSERT INTO publishers (publisher) VALUES ('대원씨아이');
INSERT INTO publishers (publisher) VALUES ('노벨피아');
INSERT INTO publishers (publisher) VALUES ('스토리튠즈');
INSERT INTO publishers (publisher) VALUES ('북큐브네트웍스');
INSERT INTO publishers (publisher) VALUES ('고렘팩토리');
INSERT INTO publishers (publisher) VALUES ('스토리위즈');
INSERT INTO publishers (publisher) VALUES ('작가컴퍼니');
INSERT INTO publishers (publisher) VALUES ('에피루스');
INSERT INTO publishers (publisher) VALUES ('NHN, 라비앙로즈');
INSERT INTO publishers (publisher) VALUES ('페퍼민트');
INSERT INTO publishers (publisher) VALUES ('와이엠북스');
INSERT INTO publishers (publisher) VALUES ('서울미디어코믹스');
INSERT INTO publishers (publisher) VALUES ('피플앤스토리');
INSERT INTO publishers (publisher) VALUES ('북팔');
INSERT INTO publishers (publisher) VALUES ('연담');
INSERT INTO publishers (publisher) VALUES ('스튜디오예스원');
INSERT INTO publishers (publisher) VALUES ('잉크어스');
INSERT INTO publishers (publisher) VALUES ('마야마루출판사');
INSERT INTO publishers (publisher) VALUES ('제이플미디어');
INSERT INTO publishers (publisher) VALUES ('로망로즈');
INSERT INTO publishers (publisher) VALUES ('툰플러스');
INSERT INTO publishers (publisher) VALUES ('인타임');
INSERT INTO publishers (publisher) VALUES ('도서출판 청어람');
INSERT INTO publishers (publisher) VALUES ('디앤씨미디어');
INSERT INTO publishers (publisher) VALUES ('스튜디오12');
INSERT INTO publishers (publisher) VALUES ('팀오쉬');
INSERT INTO publishers (publisher) VALUES ('에이템포미디어');
INSERT INTO publishers (publisher) VALUES ('G노벨');
INSERT INTO publishers (publisher) VALUES ('누온미디어');
INSERT INTO publishers (publisher) VALUES ('키다리스튜디오');
INSERT INTO publishers (publisher) VALUES ('엠스토리허브');
INSERT INTO publishers (publisher) VALUES ('브라키오 아카데미');
INSERT INTO publishers (publisher) VALUES ('루나문');
INSERT INTO publishers (publisher) VALUES ('글로번');
INSERT INTO publishers (publisher) VALUES ('romantique');
INSERT INTO publishers (publisher) VALUES ('BLYNUE블리뉴');
INSERT INTO publishers (publisher) VALUES ('원스토어북스');
INSERT INTO publishers (publisher) VALUES ('스토리야');
INSERT INTO publishers (publisher) VALUES ('루체');
INSERT INTO publishers (publisher) VALUES ('스튜디오389');
INSERT INTO publishers (publisher) VALUES ('알에스미디어');
INSERT INTO publishers (publisher) VALUES ('포텐');
INSERT INTO publishers (publisher) VALUES ('호랑공방');
INSERT INTO publishers (publisher) VALUES ('글빚는이야기꾼');
INSERT INTO publishers (publisher) VALUES ('윤송스피넬');
INSERT INTO publishers (publisher) VALUES ('제우미디어');
INSERT INTO publishers (publisher) VALUES ('위브랩');
INSERT INTO publishers (publisher) VALUES ('파란미디어');
INSERT INTO publishers (publisher) VALUES ('북극여우노블');
INSERT INTO publishers (publisher) VALUES ('로브');
INSERT INTO publishers (publisher) VALUES ('스토리작');
INSERT INTO publishers (publisher) VALUES ('신영미디어');
INSERT INTO publishers (publisher) VALUES ('contentshera');
INSERT INTO publishers (publisher) VALUES ('HAKSANNOVEL');
INSERT INTO publishers (publisher) VALUES ('에이시스미디어');
INSERT INTO publishers (publisher) VALUES ('조아라');
INSERT INTO publishers (publisher) VALUES ('스토린랩');
INSERT INTO publishers (publisher) VALUES ('리케');
INSERT INTO publishers (publisher) VALUES ('리플린');
INSERT INTO publishers (publisher) VALUES ('채음');
INSERT INTO publishers (publisher) VALUES ('다산북스');
INSERT INTO publishers (publisher) VALUES ('온글미디어');
INSERT INTO publishers (publisher) VALUES ('가하');
INSERT INTO publishers (publisher) VALUES ('제이트리미디어');
INSERT INTO publishers (publisher) VALUES ('플로린');
INSERT INTO publishers (publisher) VALUES ('러프미디어');
INSERT INTO publishers (publisher) VALUES ('펜타그램');
INSERT INTO publishers (publisher) VALUES ('나인스펙트럼');
INSERT INTO publishers (publisher) VALUES ('카멜');
INSERT INTO publishers (publisher) VALUES ('예원북스');
INSERT INTO publishers (publisher) VALUES ('설담');
INSERT INTO publishers (publisher) VALUES ('뿔미디어');
INSERT INTO publishers (publisher) VALUES ('Arete');
INSERT INTO publishers (publisher) VALUES ('판시아X스토리튠즈');
INSERT INTO publishers (publisher) VALUES ('피누스튜디오');
INSERT INTO publishers (publisher) VALUES ('청어람');
INSERT INTO publishers (publisher) VALUES ('(주)넥서스');
INSERT INTO publishers (publisher) VALUES ('판시아');
INSERT INTO publishers (publisher) VALUES ('혜다');
INSERT INTO publishers (publisher) VALUES ('주은');
INSERT INTO publishers (publisher) VALUES ('잇스토리');
INSERT INTO publishers (publisher) VALUES ('도서출판수려한');
INSERT INTO publishers (publisher) VALUES ('텐북');
INSERT INTO publishers (publisher) VALUES ('JHSBOOKS');
INSERT INTO publishers (publisher) VALUES ('(주)히트북');
INSERT INTO publishers (publisher) VALUES ('휴먼와이즈미디어');
INSERT INTO publishers (publisher) VALUES ('에필로그');
INSERT INTO publishers (publisher) VALUES ('노이컴퍼니');
INSERT INTO publishers (publisher) VALUES ('판오름');
INSERT INTO publishers (publisher) VALUES ('스카이미디어');
INSERT INTO publishers (publisher) VALUES ('영상출판미디어');
INSERT INTO publishers (publisher) VALUES ('원더랜드');
INSERT INTO publishers (publisher) VALUES ('팝콘미디어');
INSERT INTO publishers (publisher) VALUES ('J.J콘텐츠 미디어');
INSERT INTO publishers (publisher) VALUES ('더파란스튜디오(주)');
INSERT INTO publishers (publisher) VALUES ('미래로북스');
INSERT INTO publishers (publisher) VALUES ('천문창작');
INSERT INTO publishers (publisher) VALUES ('피크로맨틱');
INSERT INTO publishers (publisher) VALUES ('노블리아');
INSERT INTO publishers (publisher) VALUES ('라미북스');
INSERT INTO publishers (publisher) VALUES ('우신출판사');
INSERT INTO publishers (publisher) VALUES ('태평');
INSERT INTO publishers (publisher) VALUES ('스튜디오오드리');
INSERT INTO publishers (publisher) VALUES ('연필');
INSERT INTO publishers (publisher) VALUES ('글고운');
INSERT INTO publishers (publisher) VALUES ('osmedia');
INSERT INTO publishers (publisher) VALUES ('넥스트 프로덕션');
INSERT INTO publishers (publisher) VALUES ('비전BP');
INSERT INTO publishers (publisher) VALUES ('아미티에');
INSERT INTO publishers (publisher) VALUES ('청야');
INSERT INTO publishers (publisher) VALUES ('미디어창비');
INSERT INTO publishers (publisher) VALUES ('Bommedia');
INSERT INTO publishers (publisher) VALUES ('그래출판');
INSERT INTO publishers (publisher) VALUES ('글로라이터');
INSERT INTO publishers (publisher) VALUES ('JK미디어');
INSERT INTO publishers (publisher) VALUES ('신드롬');
INSERT INTO publishers (publisher) VALUES ('(주)스튜디오사월');
INSERT INTO publishers (publisher) VALUES ('라인북스');
INSERT INTO publishers (publisher) VALUES ('조은세상');
INSERT INTO publishers (publisher) VALUES ('글공방');
INSERT INTO publishers (publisher) VALUES ('다설');
INSERT INTO publishers (publisher) VALUES ('유주얼미디어');
INSERT INTO publishers (publisher) VALUES ('블루픽스튜디오');
INSERT INTO publishers (publisher) VALUES ('웰메이드');
INSERT INTO publishers (publisher) VALUES ('황금가지');
INSERT INTO publishers (publisher) VALUES ('스토리위즈M');
INSERT INTO publishers (publisher) VALUES ('늘솔북스');
INSERT INTO publishers (publisher) VALUES ('크루즈미디어');
INSERT INTO publishers (publisher) VALUES ('NCLO');
INSERT INTO publishers (publisher) VALUES ('위벨');
INSERT INTO publishers (publisher) VALUES ('솔나미디어');
INSERT INTO publishers (publisher) VALUES ('디씨씨이엔티주식회사');
INSERT INTO publishers (publisher) VALUES ('데일리북스');
INSERT INTO publishers (publisher) VALUES ('레드독퍼블리싱그룹');
INSERT INTO publishers (publisher) VALUES ('PAZBOOKS');
INSERT INTO publishers (publisher) VALUES ('WBeast');
INSERT INTO publishers (publisher) VALUES ('BLme');
INSERT INTO publishers (publisher) VALUES ('도서출판윤송');
INSERT INTO publishers (publisher) VALUES ('딜라이트북스');
INSERT INTO publishers (publisher) VALUES ('1443 북스');
INSERT INTO publishers (publisher) VALUES ('소쓰있');
INSERT INTO publishers (publisher) VALUES ('(주)더라스');
INSERT INTO publishers (publisher) VALUES ('AK커뮤니케이션즈');
INSERT INTO publishers (publisher) VALUES ('시즈닝북스');
INSERT INTO publishers (publisher) VALUES ('소시오게임즈');
INSERT INTO publishers (publisher) VALUES ('플랜엔이앤씨');
INSERT INTO publishers (publisher) VALUES ('소란북스');
INSERT INTO publishers (publisher) VALUES ('Hit');
INSERT INTO publishers (publisher) VALUES ('해피북스투유');
INSERT INTO publishers (publisher) VALUES ('신의경지공작소');
INSERT INTO publishers (publisher) VALUES ('(주)도서출판정연');
INSERT INTO publishers (publisher) VALUES ('단감');
INSERT INTO publishers (publisher) VALUES ('넥스퍼랩미디어');
INSERT INTO publishers (publisher) VALUES ('베아트리체');
INSERT INTO publishers (publisher) VALUES ('주식회사 해날미디어');
INSERT INTO publishers (publisher) VALUES ('에버애프터');
INSERT INTO publishers (publisher) VALUES ('POSTYPE ORIGINAL');
INSERT INTO publishers (publisher) VALUES ('패러그래프');
INSERT INTO publishers (publisher) VALUES ('도서출판그레이스');
INSERT INTO publishers (publisher) VALUES ('락킨코리아');
INSERT INTO publishers (publisher) VALUES ('두세븐엔터테인먼트');
INSERT INTO publishers (publisher) VALUES ('박진우스튜디오');
INSERT INTO publishers (publisher) VALUES ('곁beside');
INSERT INTO publishers (publisher) VALUES ('POPBOOKS');
INSERT INTO publishers (publisher) VALUES ('대시우드');
INSERT INTO publishers (publisher) VALUES ('아성민준');
INSERT INTO publishers (publisher) VALUES ('타불라북스');
INSERT INTO publishers (publisher) VALUES ('조은세상북두');
INSERT INTO publishers (publisher) VALUES ('YJ코믹스');
INSERT INTO publishers (publisher) VALUES ('북스웨이브');
INSERT INTO publishers (publisher) VALUES ('스토리존');
INSERT INTO publishers (publisher) VALUES ('마녀주식회사');
INSERT INTO publishers (publisher) VALUES ('오렌지트랙');
INSERT INTO publishers (publisher) VALUES ('하늘꽃');
INSERT INTO publishers (publisher) VALUES ('스튜디오 그리고');
INSERT INTO publishers (publisher) VALUES ('크로스픽쳐스');
INSERT INTO publishers (publisher) VALUES ('21세기북스');
INSERT INTO publishers (publisher) VALUES ('동슬미디어');
INSERT INTO publishers (publisher) VALUES ('새움출판사');
INSERT INTO publishers (publisher) VALUES ('케이북스');
INSERT INTO publishers (publisher) VALUES ('헤수스Books');
INSERT INTO publishers (publisher) VALUES ('구디스튜디오');
INSERT INTO publishers (publisher) VALUES ('오렌지디');
INSERT INTO publishers (publisher) VALUES ('용비어천가이앤엠');
INSERT INTO publishers (publisher) VALUES ('이미지프레임');
INSERT INTO publishers (publisher) VALUES ('CLB');
INSERT INTO publishers (publisher) VALUES ('스토리아크');
INSERT INTO publishers (publisher) VALUES ('도서출판별솔');
INSERT INTO publishers (publisher) VALUES ('엘베스트');
INSERT INTO publishers (publisher) VALUES ('야담');
INSERT INTO publishers (publisher) VALUES ('유펜비');
INSERT INTO publishers (publisher) VALUES ('시크릿e북');
INSERT INTO publishers (publisher) VALUES ('교보문고');
INSERT INTO publishers (publisher) VALUES ('스마트빅');
INSERT INTO publishers (publisher) VALUES ('디엘미디어');
INSERT INTO publishers (publisher) VALUES ('검색');
INSERT INTO publishers (publisher) VALUES ('웅진북센');
INSERT INTO publishers (publisher) VALUES ('주성민');
INSERT INTO publishers (publisher) VALUES ('애니툰');
INSERT INTO publishers (publisher) VALUES ('쭈');
INSERT INTO publishers (publisher) VALUES ('이야기들');
INSERT INTO publishers (publisher) VALUES ('데이즈');
INSERT INTO publishers (publisher) VALUES ('판시아x연필');
INSERT INTO publishers (publisher) VALUES ('엠콘텐츠랩스');
INSERT INTO publishers (publisher) VALUES ('NEOWIZ');
INSERT INTO publishers (publisher) VALUES ('소울에임');
INSERT INTO publishers (publisher) VALUES ('소미미디어');
INSERT INTO publishers (publisher) VALUES ('시나브로');
INSERT INTO publishers (publisher) VALUES ('쌤앤파커스');
INSERT INTO publishers (publisher) VALUES ('(주)네오플');
INSERT INTO publishers (publisher) VALUES ('엑시트이엔엠');
INSERT INTO publishers (publisher) VALUES ('hinovel');
INSERT INTO publishers (publisher) VALUES ('펌킨스튜디오');
INSERT INTO publishers (publisher) VALUES ('ALM미디어');
INSERT INTO publishers (publisher) VALUES ('HK북스');
INSERT INTO publishers (publisher) VALUES ('하이콘');
INSERT INTO publishers (publisher) VALUES ('웅진씽크빅');
INSERT INTO publishers (publisher) VALUES ('팩트스토리');
INSERT INTO publishers (publisher) VALUES ('밀크레인');
INSERT INTO publishers (publisher) VALUES ('앨리스인');
INSERT INTO publishers (publisher) VALUES ('브리드');
INSERT INTO publishers (publisher) VALUES ('독서일가');
INSERT INTO publishers (publisher) VALUES ('비엔비컴퍼니');
INSERT INTO publishers (publisher) VALUES ('스너그');
INSERT INTO publishers (publisher) VALUES ('드림앤스토리');
INSERT INTO publishers (publisher) VALUES ('더로맨틱');
INSERT INTO publishers (publisher) VALUES ('be주류');
INSERT INTO publishers (publisher) VALUES ('스토리해윰');
INSERT INTO publishers (publisher) VALUES ('YADAM');
INSERT INTO publishers (publisher) VALUES ('위메이드');
INSERT INTO publishers (publisher) VALUES ('고경오');
INSERT INTO publishers (publisher) VALUES ('문희담');
INSERT INTO publishers (publisher) VALUES ('다울북');
INSERT INTO publishers (publisher) VALUES ('케이너스랩');
INSERT INTO publishers (publisher) VALUES ('희우');
INSERT INTO publishers (publisher) VALUES ('비단숲');
INSERT INTO publishers (publisher) VALUES ('와이엔비미디어');
INSERT INTO publishers (publisher) VALUES ('고즈넉이엔티');
INSERT INTO publishers (publisher) VALUES ('문학동네');
INSERT INTO publishers (publisher) VALUES ('엔블록');
INSERT INTO publishers (publisher) VALUES ('도서출판레토');
INSERT INTO publishers (publisher) VALUES ('제이알매니지먼트');
INSERT INTO publishers (publisher) VALUES ('문샷');
INSERT INTO publishers (publisher) VALUES ('14월의책');
INSERT INTO publishers (publisher) VALUES ('판다플립');
INSERT INTO publishers (publisher) VALUES ('은빛별총총');
INSERT INTO publishers (publisher) VALUES ('주식회사스토리위즈');

-- users 값 insert 코드
INSERT INTO users (users) VALUES ('전체이용가');
INSERT INTO users (users) VALUES ('19세이용가');
INSERT INTO users (users) VALUES ('15세이용가');

-- genre 값 insers 코드
INSERT INTO users (users) VALUES ('판타지');
INSERT INTO users (users) VALUES ('로판');
INSERT INTO users (users) VALUES ('로맨스');
INSERT INTO users (users) VALUES ('무협');
INSERT INTO users (users) VALUES ('BL');
INSERT INTO users (users) VALUES ('드라마');
INSERT INTO users (users) VALUES ('현판');

-- 키워드 insert
INSERT INTO keywords (keyword) VALUES ('총'), ('우월녀'), ('환생'), ('퓨전'), ('재벌'), ('가수'), ('까칠녀'), ('운동선수'), ('의사'), ('TS'), ('레이드'), ('선배'), ('삼각관계'), ('탑등반'), ('남장여자물'), ('운명'), ('중세물'), ('아티팩트'), ('초능력'), ('능글수'), ('맞선관계'), ('다공일수'), ('소방관'), ('차원이동'), ('오만남'), ('트라우마'), ('노력'), ('인외존재'), ('오래된연인'), ('SF/미래물'), ('육아'), ('대형견공'), ('깽판'), ('게임물'), ('학원물'), ('네크로맨서'), ('직진공'), ('신'), ('상처수'), ('하렘물'), ('후회수'), ('까칠수'), ('지존'), ('성장물'), ('배틀연애'), ('조신남'), ('순정녀'), ('드라마'), ('성좌'), ('전쟁'), ('시한부'), ('BL'), ('울보공'), ('SF'), ('악녀'), ('할리킹'), ('무자각집착공'), ('오메가버스'), ('원나잇'), ('짝사랑수'), ('회사원'), ('무공'), ('존댓말남'), ('표국'), ('순정공'), ('조직/암흑가'), ('금단의관계'), ('동양풍'), ('유혹녀'), ('도사'), ('판타지드라마'), ('계약관계'), ('회귀'), ('법조인'), ('귀환'), ('소유욕/독점욕'), ('선계'), ('철벽녀'), ('아포칼립스'), ('순정남'), ('냉혈수'), ('로맨스판타지'), ('게임'), ('창'), ('나이차커플'), ('정통판타지'), ('왕족/귀족'), ('마계'), ('사제지간'), ('무심수'), ('초월적존재'), ('카리스마남'), ('호러'), ('역사'), ('정치가'), ('재벌공'), ('치유물'), ('상처녀'), ('피폐물'), ('힐링물'), ('정령'), ('복수'), ('순진녀'), ('우월수'), ('망나니'), ('남장여자'), ('경찰'), ('책사'), ('스포츠'), ('갑을관계'), ('암투물'), ('외국인남/혼혈'), ('연예계물'), ('친구>연인'), ('미스테리'), ('집착남'), ('가족후회물'), ('영혼체인지'), ('능력공'), ('다정수'), ('재벌수'), ('GL'), ('성장'), ('기갑'), ('첫사랑'), ('강공'), ('화산'), ('계략남'), ('회귀물'), ('마왕'), ('몸정>맘정'), ('옴니버스'), ('협객'), ('메디컬물'), ('정파'), ('신파'), ('감독/스카우터'), ('막장'), ('미인공'), ('천재'), ('무심공'), ('뇌섹녀'), ('능력녀'), ('능력수'), ('연하공'), ('존댓말공'), ('마법사'), ('무협물'), ('정령술사'), ('궁정로맨스'), ('상처공'), ('마교'), ('나쁜여자'), ('정통'), ('외유내강'), ('학원'), ('순진남'), ('추미스'), ('용병'), ('검'), ('짝사랑남'), ('재벌남'), ('다정녀'), ('법조계'), ('평범남'), ('무당'), ('집착수'), ('추리/수사물'), ('자상녀'), ('무심녀'), ('권'), ('애교녀'), ('테이밍'), ('애잔물'), ('상인'), ('성직자'), ('집착녀'), ('경쟁구도'), ('서포터'), ('대체역사'), ('미남공'), ('라이트노벨'), ('오해물'), ('아이돌물'), ('신화물'), ('차도남'), ('시대물'), ('달달물'), ('미남수'), ('리맨물'), ('잔잔물'), ('냉정남'), ('유혹공'), ('동정남'), ('이종족'), ('영웅/신화'), ('요리사'), ('집착공'), ('하렘'), ('나쁜남자'), ('후회공'), ('용사'), ('능력남'), ('검사'), ('의원'), ('애교남'), ('상처남'), ('재회물'), ('기사물'), ('능글공'), ('사내연애'), ('츤데레남'), ('직진녀'), ('역하렘'), ('소림'), ('가상시대물'), ('헌터물'), ('빙의물'), ('크툴루'), ('캠퍼스물'), ('직업물'), ('절륜녀'), ('형사'), ('영어덜트'), ('서양풍'), ('만능'), ('까칠남'), ('기억상실'), ('술법'), ('속도위반'), ('서브수있음'), ('유혹수'), ('냉혈공'), ('퓨전사극'), ('여공남수'), ('다정공'), ('감금'), ('광공'), ('코믹'), ('짝사랑녀'), ('영지'), ('절륜공'), ('계략녀'), ('신데렐라'), ('대장장이/생산직'), ('먹방/요리'), ('궁'), ('동거물'), ('스포츠물'), ('계략수'), ('재벌녀'), ('일상드라마'), ('군인'), ('육아물'), ('라이벌/앙숙'), ('절륜남'), ('궁사'), ('사파'), ('시스템'), ('여주판타지'), ('시대/역사로맨스'), ('무심남'), ('메디컬'), ('독'), ('걸크러쉬'), ('사이다'), ('로맨틱코미디'), ('사이다남'), ('일상물'), ('고인물'), ('까칠공'), ('현대로맨스'), ('사이다녀'), ('궁정물'), ('신분차이'), ('객잔무협'), ('서브공있음'), ('현대물'), ('마검사'), ('직진수'), ('우연한만남'), ('학생'), ('연하남'), ('전문직'), ('삼국지'), ('가이드버스'), ('레이드물'), ('사차원남'), ('좀비'), ('권선징악'), ('기타 스포츠'), ('디자이너'), ('전문직물'), ('차원이동물'), ('츤데레공'), ('살수'), ('털털녀'), ('추리물'), ('절륜수'), ('짝사랑'), ('격투가'), ('낭인'), ('외국인/혼혈'), ('오만공'), ('착각'), ('곤륜'), ('가족물'), ('착각물'), ('명문세가'), ('개그물'), ('해외로맨스'), ('빙의'), ('능글녀'), ('도도녀'), ('플레이어'), ('힐러'), ('기자'), ('작가'), ('환생물'), ('오피스물'), ('엉뚱발랄녀'), ('수인물'), ('유혹남'), ('철벽수'), ('순진공'), ('천마'), ('후회남'), ('BJ'), ('복수물'), ('냉정녀'), ('미스터리'), ('베이비메신저'), ('조력자'), ('외유내강수'), ('포식/흡수'), ('오빠'), ('순진수'), ('쌍방삽질'), ('축구'), ('휴머니즘'), ('학사'), ('방송'), ('실존인물'), ('능글남'), ('매니저'), ('경영/기업'), ('군대물'), ('대형견남'), ('판타지물'), ('이능력'), ('계략공'), ('시월드'), ('먼치킨'), ('순정수'), ('다정남'), ('남궁'), ('배우'), ('헌신공'), ('야구'), ('바람둥이'), ('운동선수공'), ('평범수'), ('시리어스물'), ('정략결혼'), ('수사물'), ('직진남'), ('타임슬립'), ('짝사랑공'), ('소꿉친구'), ('철벽남'), ('명랑수'), ('사이코패스'), ('퇴마사'), ('평범녀'), ('후회녀'), ('AI'), ('동정공'), ('생존'), ('PD/감독'), ('오컬트');

CREATE INDEX idx_novels_user_id ON novels(users_id);
CREATE INDEX idx_novels_publisher_id ON novels(publisher_id);
CREATE INDEX idx_novels_genre_id ON novels(genre_id);