DROP TABLE family;
CREATE TABLE family(

   id_family SERIAL PRIMARY KEY,
	description VARCHAR(255) NOT NULL
	

);

INSERT INTO family(description) VALUES ('Cajon');


SELECT *
 FROM family;


DROP TABLE category;
CREATE TABLE category(

 id_category SERIAL PRIMARY KEY,
 description VARCHAR(255) NOT NULL

);

INSERT INTO category(description) VALUES ('Séries');

SELECT *
 FROM category;




DROP TABLE sub_category;
CREATE TABLE sub_category(

	id_sub_category SERIAL PRIMARY KEY,
    description VARCHAR(255)NOT NULL,
	id_category INTEGER NOT NULL,
	FOREIGN KEY (id_sub_category)
	REFERENCES category(id_category)
	
);

INSERT INTO sub_category(description, id_category) VALUES ('Alimentação', 1);

SELECT *
 FROM sub_category;



DROP TABLE user_meva;
CREATE TABLE user_meva(

	cpf CHAR(11) PRIMARY KEY,
	nome VARCHAR(250) NOT NULL,
	genero CHAR(1) NOT NULL,
	date VARCHAR(100) NOT NULL,
	estado VARCHAR(100)NOT NULL,
	cidade VARCHAR(100)NOT NULL,
	id_family INTEGER NOT NULL,
	FOREIGN KEY (id_family)
	  REFERENCES family (id_family)
	ON UPDATE CASCADE 
	
	
);

INSERT INTO user_meva(cpf, nome, genero, date, estado, cidade,id_family) VALUES (48454305840,'João', 'M', '2004-04-23', 'São Paulo', 'SP', 1);
INSERT INTO user_meva(cpf, nome, genero, date, estado, cidade,id_family) VALUES (23456701981,'Fabio', 'M', '1980-12-23', 'São Paulo', 'SP', 1);
INSERT INTO user_meva(cpf, nome, genero, date, estado, cidade,id_family) VALUES (32164578901,'Renta', 'F', '1980-01-03', 'São Paulo', 'SP', 1);
INSERT INTO user_meva(cpf, nome, genero, date, estado, cidade,id_family) VALUES (2345909154, 'Felipe', 'M','1990-05-24', 'São Paulo', 'SP',2);
SELECT *
 FROM user_meva;
 


DROP TABLE monyth_expenses; 
CREATE TABLE monyth_expenses(
 
	 id_monyth_expenses SERIAL PRIMARY KEY,
	 description VARCHAR(255)NOT NULL,
	 "VALUE" DOUBLE PRECISION NOT NULL,
	   id_family INTEGER NOT NULL,
    id_category INTEGER NOT NULL,
	 cpf CHAR(11) NOT NULL,
	 type VARCHAR(50) NOT NULL,
	 "date" DATE NOT NULL,
	 parcel INTEGER,
	 banck VARCHAR(10), 
	 
	 FOREIGN KEY (id_family)
	  REFERENCES family(id_family),
	 
	 FOREIGN KEY (id_category)
	   REFERENCES category(id_category),
	 
	 FOREIGN KEY (cpf)
	   REFERENCES user_meva(cpf)
	 
 );
 
 
 INSERT INTO monyth_expenses(cpf,banck,parcel,description,"VALUE","date",type,id_family,id_category)
  VALUES(48454305840,'Nubank',3,'Viagem',2.062,'2023-03-24','Debito',1,1);
 
 SELECT *
  FROM monyth_expenses;
 


DROP TABLE close_month;
CREATE TABLE close_month(
 
 id_close_month SERIAL PRIMARY KEY,
 valor_total DOUBLE PRECISION NOT NULL,
 "month" DATE NOT NULL,
   date_update DATE NOT NULL,
	id_family INTEGER NOT NULL,
	 FOREIGN KEY (id_family)
	  REFERENCES family (id_family)
	 
 );
 
 INSERT INTO close_month(valor_total,"month",date_update,id_family) VALUES (3.500,'2023-04-01','2023-04-30',1);
 
 SELECT *
   FROM close_month;
   

DROP TABLE life_cost;  
CREATE TABLE life_cost(
 
  id_life_cost SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL,
  "value" DOUBLE PRECISION NOT NULL,
  "month" DATE NOT NULL,
  id_family INTEGER NOT NULL,
  FOREIGN KEY (id_family)
    REFERENCES family (id_family)
  
);

INSERT INTO life_cost(description,"value","month", id_family) VALUES ('Alimentação',300,'2023-03-25',1);


SELECT *
  FROM life_cost;
  


DROP TABLE debt;
CREATE TABLE debt(

   id_debt SERIAL PRIMARY KEY,
	description VARCHAR(250) NOT NULL,
	"value" DOUBLE PRECISION NOT NULL,
	id_family INTEGER NOT NULL,
	id_category INTEGER NOT NULL,
	cpf CHAR(11) NOT NULL,
	"date" DATE NOT NULL,
	parcel INTEGER NOT NULL,
	bank VARCHAR,
	
	 FOREIGN KEY (id_family)
	  REFERENCES family(id_family),
	 
	 FOREIGN KEY (id_category)
	   REFERENCES category(id_category),
	 
	 FOREIGN KEY (cpf)
	   REFERENCES user_meva(cpf)
	 

);

INSERT INTO debt(description,"value",id_family,id_category,cpf,"date",parcel,bank) 
  VALUES ('Cartão de Crédito',500,1,1,48454305840,'2023-03-25',2,'Nubank');

SELECT *
 FROM debt;
 

SELECT 
  *
 FROM 
  user_meva
 Order By
     date
;	 
 
  
SELECT U.nome,F.description
FROM user_meva as U
    JOIN family As F ON U.id_family = F.id_family;
   
   