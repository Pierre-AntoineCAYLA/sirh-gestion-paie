CREATE TABLE grade (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  CODE VARCHAR(255) DEFAULT NULL,
  NBHEURESBASE DECIMAL(10, 2) DEFAULT NULL,
  TAUXBASE DECIMAL(10, 2) DEFAULT NULL,
  PRIMARY KEY (ID));
  
  CREATE TABLE cotisation (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  CODE VARCHAR(255) DEFAULT NULL,
  LIBELLE VARCHAR(255) DEFAULT NULL,
  TAUXSALARIAL DECIMAL(10, 2) DEFAULT NULL,
  TAUXPATRONAL DECIMAL(10, 2) DEFAULT NULL,
  PRIMARY KEY (ID));