CREATE TABLE `hospital`.`doctor` (
  `iddoctor` INT NOT NULL AUTO_INCREMENT,
  `dname` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddoctor`)
);

CREATE TABLE `hospital`.`medicine` (
  `idmedicine` INT NOT NULL AUTO_INCREMENT,
  `mname` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmedicine`)
);

CREATE TABLE `hospital`.`labs` (
  `idlabs` INT NOT NULL AUTO_INCREMENT,
  `larea` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  PRIMARY KEY (`idlabs`)
);

CREATE TABLE `hospital`.`patient` (
  `idpatient` INT NOT NULL AUTO_INCREMENT,
  `pname` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpatient`)
);

CREATE TABLE `hospital`.`labtest` (
  `idlabtest` INT NOT NULL AUTO_INCREMENT,
  `idpatient` INT NOT NULL,
  `idlabs` INT NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlabtest`),
  INDEX `idpatient_idx` (`idpatient` ASC) VISIBLE,
  INDEX `idlabs_idx` (`idlabs` ASC) VISIBLE,
  CONSTRAINT `idpatientlab`
    FOREIGN KEY (`idpatient`)
    REFERENCES `hospital`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idlabs_fk`
    FOREIGN KEY (`idlabs`)
    REFERENCES `hospital`.`labs` (`idlabs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `hospital`.`order` (
  `idorder` INT NOT NULL AUTO_INCREMENT,
  `idpatient` INT NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `idmedicine` INT NOT NULL,
  `qty` INT NULL,
  `total` INT NULL,
  PRIMARY KEY (`idorder`),
  INDEX `idpatient_idx` (`idpatient` ASC) VISIBLE,
  INDEX `idmedicine_idx` (`idmedicine` ASC) VISIBLE,
  CONSTRAINT `idpatient`
    FOREIGN KEY (`idpatient`)
    REFERENCES `hospital`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmedicine`
    FOREIGN KEY (`idmedicine`)
    REFERENCES `hospital`.`medicine` (`idmedicine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `hospital`.`channel` (
  `idchannel` INT NOT NULL AUTO_INCREMENT,
  `iddoctor` INT NOT NULL,
  `idpatient` INT NOT NULL,
  `date` DATE NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `channelcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idchannel`),
  INDEX `fkpatient_idx` (`idpatient` ASC) VISIBLE,
  INDEX `fkdoctor_idx` (`iddoctor` ASC) VISIBLE,
  CONSTRAINT `fkpatient`
    FOREIGN KEY (`idpatient`)
    REFERENCES `hospital`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkdoctor`
    FOREIGN KEY (`iddoctor`)
    REFERENCES `hospital`.`doctor` (`iddoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
