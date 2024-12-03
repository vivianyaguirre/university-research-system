-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs_vya95458
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs_vya95458
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_vya95458` DEFAULT CHARACTER SET utf8 ;
USE `cs_vya95458` ;

-- -----------------------------------------------------
-- Table `cs_vya95458`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Department` (
  `idDepartment` INT NOT NULL,
  `deptName` VARCHAR(45) NOT NULL,
  `annualBudget` DECIMAL(12,2) NOT NULL,
  `location` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idDepartment`),
  UNIQUE INDEX `deptName_UNIQUE` (`deptName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Project` (
  `idProject` INT NOT NULL,
  `projectTitle` VARCHAR(45) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NULL,
  `budget` DECIMAL(12,2) NOT NULL,
  `idDepartment` INT NOT NULL,
  PRIMARY KEY (`idProject`),
  INDEX `fk_Project_Department1_idx` (`idDepartment` ASC) VISIBLE,
  CONSTRAINT `fk_Project_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `cs_vya95458`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Researcher` (
  `idResearcher` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `yrsOfExperience` VARCHAR(45) NOT NULL,
  `idDepartment` INT NOT NULL,
  `reportsTo` INT NULL,
  PRIMARY KEY (`idResearcher`),
  INDEX `fk_Researcher_Department1_idx` (`idDepartment` ASC) VISIBLE,
  INDEX `fk_Researcher_Researcher1_idx` (`reportsTo` ASC) VISIBLE,
  CONSTRAINT `fk_Researcher_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `cs_vya95458`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Researcher_Researcher1`
    FOREIGN KEY (`reportsTo`)
    REFERENCES `cs_vya95458`.`Researcher` (`idResearcher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`FundingSource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`FundingSource` (
  `idFundingSource` INT NOT NULL,
  `fundName` VARCHAR(45) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `amount` DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (`idFundingSource`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Equipment` (
  `idEquipment` INT NOT NULL AUTO_INCREMENT,
  `equipName` VARCHAR(45) NOT NULL,
  `maintenanceCost` DECIMAL(12,2) NOT NULL,
  `availabilityStatus` TINYINT NOT NULL,
  PRIMARY KEY (`idEquipment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Publication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Publication` (
  `idPub` INT NOT NULL,
  `pubTitle` VARCHAR(75) NOT NULL,
  `pubDate` DATE NOT NULL,
  `journal` VARCHAR(75) NOT NULL,
  `citationCount` INT NULL DEFAULT 0,
  `idProject` INT NULL,
  PRIMARY KEY (`idPub`),
  INDEX `fk_Publication_Project1_idx` (`idProject` ASC) VISIBLE,
  CONSTRAINT `fk_Publication_Project1`
    FOREIGN KEY (`idProject`)
    REFERENCES `cs_vya95458`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Dataset` (
  `idData` INT NOT NULL AUTO_INCREMENT,
  `dataTitle` VARCHAR(45) NOT NULL,
  `format` VARCHAR(45) NOT NULL,
  `accessibility` VARCHAR(10) NOT NULL,
  `collectedDate` DATE NOT NULL,
  `idProject` INT NULL,
  PRIMARY KEY (`idData`),
  INDEX `fk_Dataset_Project1_idx` (`idProject` ASC) VISIBLE,
  CONSTRAINT `fk_Dataset_Project1`
    FOREIGN KEY (`idProject`)
    REFERENCES `cs_vya95458`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Project_has_Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Project_has_Researcher` (
  `idProject` INT NOT NULL,
  `idResearcher` INT NOT NULL,
  `roleInProject` VARCHAR(45) NULL,
  `roleStart` DATE NOT NULL,
  `roleEnd` DATE NULL,
  `contributionDescrip` VARCHAR(80) NULL,
  PRIMARY KEY (`idProject`, `idResearcher`),
  INDEX `fk_Project_has_Researcher_Researcher1_idx` (`idResearcher` ASC) VISIBLE,
  INDEX `fk_Project_has_Researcher_Project_idx` (`idProject` ASC) VISIBLE,
  CONSTRAINT `fk_Project_has_Researcher_Project`
    FOREIGN KEY (`idProject`)
    REFERENCES `cs_vya95458`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Project_has_Researcher_Researcher1`
    FOREIGN KEY (`idResearcher`)
    REFERENCES `cs_vya95458`.`Researcher` (`idResearcher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Grants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Grants` (
  `idProject` INT NOT NULL,
  `grantAmount` DECIMAL(12,2) NOT NULL,
  `grantDate` DATE NULL,
  `grantConditions` VARCHAR(85) NULL,
  `grantStatus` VARCHAR(20) NOT NULL,
  `idFundingSource` INT NOT NULL,
  PRIMARY KEY (`idProject`, `idFundingSource`),
  INDEX `fk_FundingSource_has_Project_Project1_idx` (`idProject` ASC) VISIBLE,
  INDEX `fk_Grant_FundingSource1_idx` (`idFundingSource` ASC) VISIBLE,
  CONSTRAINT `fk_FundingSource_has_Project_Project1`
    FOREIGN KEY (`idProject`)
    REFERENCES `cs_vya95458`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grant_FundingSource1`
    FOREIGN KEY (`idFundingSource`)
    REFERENCES `cs_vya95458`.`FundingSource` (`idFundingSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`ProjectEquipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`ProjectEquipment` (
  `idEquipment` INT NOT NULL,
  `idProject` INT NOT NULL,
  `usageStart` DATE NOT NULL,
  `usageEnd` DATE NULL,
  PRIMARY KEY (`idEquipment`, `idProject`),
  INDEX `fk_Equipment_has_Project_Project1_idx` (`idProject` ASC) VISIBLE,
  INDEX `fk_Equipment_has_Project_Equipment1_idx` (`idEquipment` ASC) VISIBLE,
  CONSTRAINT `fk_Equipment_has_Project_Equipment1`
    FOREIGN KEY (`idEquipment`)
    REFERENCES `cs_vya95458`.`Equipment` (`idEquipment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipment_has_Project_Project1`
    FOREIGN KEY (`idProject`)
    REFERENCES `cs_vya95458`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`CollaboratingInstitution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`CollaboratingInstitution` (
  `idCollab` INT NOT NULL,
  `institutionName` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `partnershipDate` DATE NOT NULL,
  `expertiseField` VARCHAR(75) NULL,
  PRIMARY KEY (`idCollab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_vya95458`.`Project_has_CollaboratingInstitution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_vya95458`.`Project_has_CollaboratingInstitution` (
  `idProject` INT NOT NULL,
  `idCollab` INT NOT NULL,
  `collabRole` VARCHAR(45) NULL,
  PRIMARY KEY (`idProject`, `idCollab`),
  INDEX `fk_Project_has_CollaboratingInstitution_CollaboratingInstit_idx` (`idCollab` ASC) VISIBLE,
  INDEX `fk_Project_has_CollaboratingInstitution_Project1_idx` (`idProject` ASC) VISIBLE,
  CONSTRAINT `fk_Project_has_CollaboratingInstitution_Project1`
    FOREIGN KEY (`idProject`)
    REFERENCES `cs_vya95458`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Project_has_CollaboratingInstitution_CollaboratingInstitut1`
    FOREIGN KEY (`idCollab`)
    REFERENCES `cs_vya95458`.`CollaboratingInstitution` (`idCollab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `cs_vya95458`.`Department` (`idDepartment`, `deptName`, `annualBudget`, `location`) VALUES
(1, 'Computer Science', 2000000.00, 'Building A'),
(2, 'Physics', 1500000.00, 'Building B'),
(3, 'Chemistry', 1200000.00, 'Building C'),
(4, 'Biology', 1000000.00, 'Building D'),
(5, 'Mathematics', 800000.00, 'Building E'),
(6, 'Engineering', 1800000.00, 'Building F'),
(7, 'Environmental Science', 900000.00, 'Building G'),
(8, 'Medicine', 2100000.00, 'Building H'),
(9, 'Economics', 1300000.00, 'Building I'),
(10, 'Statistics', 1100000.00, 'Building J');

INSERT INTO `cs_vya95458`.`Project` (`idProject`, `projectTitle`, `startDate`, `endDate`, `budget`, `idDepartment`) VALUES
(1, 'AI Research', '2023-01-01', '2025-12-31', 500000.00, 1),
(2, 'Quantum Mechanics', '2022-06-01', '2024-11-30', 300000.00, 2),
(3, 'Organic Chemistry', '2023-03-15', '2025-07-15', 250000.00, 3),
(4, 'Genetics Study', '2023-05-10', NULL, 400000.00, 4),
(5, 'Number Theory', '2023-02-20', NULL, 150000.00, 5),
(6, 'Civil Engineering Projects', '2021-04-01', '2023-04-01', 600000.00, 6),
(7, 'Climate Change Impacts', '2022-01-15', '2024-01-15', 320000.00, 7),
(8, 'Cancer Research', '2021-07-01', NULL, 1000000.00, 8),
(9, 'Financial Modelling', '2023-02-01', '2024-02-01', 400000.00, 9),
(10, 'Machine Learning in Healthcare', '2023-03-01', '2024-12-31', 700000.00, 10);

INSERT INTO `cs_vya95458`.`Researcher` (`idResearcher`, `name`, `role`, `yrsOfExperience`, `idDepartment`, `reportsTo`) VALUES
(1, 'Alice Smith', 'Professor', '10', 1, NULL),
(2, 'Bob Johnson', 'Assistant Professor', '5', 2, 1),
(3, 'Carol White', 'Research Scientist', '8', 3, NULL),
(4, 'David Black', 'PhD Student', '2', 4, 3),
(5, 'Emma Green', 'Postdoc Researcher', '4', 5, 1),
(6, 'Frank Brown', 'Associate Professor', '7', 6, NULL),
(7, 'Grace Lee', 'Lab Technician', '3', 7, 6),
(8, 'Hannah Wright', 'Research Fellow', '6', 8, NULL),
(9, 'Ian Taylor', 'Data Analyst', '4', 9, 8),
(10, 'John Davis', 'Senior Lecturer', '9', 10, NULL);

INSERT INTO `cs_vya95458`.`FundingSource` (`idFundingSource`, `fundName`, `type`, `amount`) VALUES
(1, 'National Science Foundation', 'Government', 500000.00),
(2, 'Gates Foundation', 'Private', 300000.00),
(3, 'NIH', 'Government', 750000.00),
(4, 'NASA', 'Government', 200000.00),
(5, 'UNICEF', 'Non-Profit', 120000.00),
(6, 'WHO', 'Non-Profit', 180000.00),
(7, 'Google Research', 'Corporate', 600000.00),
(8, 'Facebook AI', 'Corporate', 250000.00),
(9, 'Intel Foundation', 'Corporate', 400000.00),
(10, 'Ford Foundation', 'Private', 350000.00);


INSERT INTO `cs_vya95458`.`Equipment` (`idEquipment`, `equipName`, `maintenanceCost`, `availabilityStatus`) VALUES
(1, 'Microscope', 2000.00, 1),
(2, 'Spectrometer', 3000.00, 1),
(3, 'X-Ray Machine', 5000.00, 0),
(4, 'PCR Machine', 1500.00, 1),
(5, 'Centrifuge', 1200.00, 1),
(6, 'Thermal Cycler', 1800.00, 0),
(7, 'DNA Sequencer', 6000.00, 1),
(8, 'Electron Microscope', 8000.00, 1),
(9, 'MRI Scanner', 10000.00, 0),
(10, 'Ultracentrifuge', 5500.00, 1);

INSERT INTO `cs_vya95458`.`Publication` (`idPub`, `pubTitle`, `pubDate`, `journal`, `citationCount`, `idProject`) VALUES
(1, 'AI in Healthcare', '2023-05-15', 'Journal of AI Research', 10, 1),
(2, 'Quantum Mechanics Theory', '2023-03-10', 'Physics Today', 5, 2),
(3, 'Organic Compounds Study', '2023-08-21', 'Chemistry World', 15, 3),
(4, 'Genetic Disorders', '2024-01-12', 'Genetics Journal', 12, 4),
(5, 'Advances in Mathematics', '2022-11-30', 'Math Monthly', 8, 5),
(6, 'Civil Engineering Innovations', '2023-06-11', 'Engineering News', 3, 6),
(7, 'Climate Science Report', '2022-07-18', 'Environmental Studies', 9, 7),
(8, 'Cancer Treatment Advances', '2023-04-25', 'Medical Journal', 20, 8),
(9, 'Economic Modelling', '2023-12-01', 'Economics Journal', 6, 9),
(10, 'Machine Learning Applications', '2023-11-15', 'AI & Data Journal', 13, 10);

INSERT INTO `cs_vya95458`.`Dataset` (`idData`, `dataTitle`, `format`, `accessibility`, `collectedDate`, `idProject`) VALUES
(1, 'AI Dataset', 'CSV', 'Public', '2023-05-01', 1),
(2, 'Quantum Mechanics Data', 'Excel', 'Private', '2022-07-01', 2),
(3, 'Organic Chemistry Data', 'CSV', 'Public', '2023-03-12', 3),
(4, 'Genetics Data', 'Excel', 'Private', '2023-08-08', 4),
(5, 'Mathematics Dataset', 'CSV', 'Public', '2023-02-05', 5),
(6, 'Engineering Dataset', 'Excel', 'Private', '2022-11-15', 6),
(7, 'Climate Change Data', 'CSV', 'Public', '2023-04-20', 7),
(8, 'Cancer Research Data', 'Excel', 'Private', '2023-06-10', 8),
(9, 'Economic Data', 'CSV', 'Public', '2023-09-01', 9),
(10, 'Healthcare Machine Learning', 'CSV', 'Private', '2023-11-05', 10);

INSERT INTO `cs_vya95458`.`Project_has_Researcher` (`idProject`, `idResearcher`, `roleInProject`, `roleStart`, `roleEnd`, `contributionDescrip`) VALUES
(1, 1, 'Lead Researcher', '2023-01-01', NULL, 'Oversees AI research'),
(2, 2, 'Researcher', '2022-06-01', NULL, 'Quantum theory development'),
(3, 3, 'Research Scientist', '2023-03-15', '2025-03-15', 'Analyzes organic compounds'),
(4, 4, 'Assistant Researcher', '2023-05-10', NULL, 'Genetic research'),
(5, 5, 'Mathematician', '2023-02-20', NULL, 'Develops algorithms'),
(6, 6, 'Project Manager', '2021-04-01', '2023-04-01', 'Manages project timeline'),
(7, 7, 'Data Collector', '2022-01-15', NULL, 'Gathers environmental data'),
(8, 8, 'Lead Scientist', '2021-07-01', NULL, 'Conducts cancer research'),
(9, 9, 'Data Analyst', '2023-02-01', '2024-02-01', 'Analyzes financial data'),
(10, 10, 'AI Developer', '2023-03-01', '2024-12-31', 'Builds ML models');

INSERT INTO `cs_vya95458`.`Grants` (`idProject`, `grantAmount`, `grantDate`, `grantConditions`, `grantStatus`, `idFundingSource`) VALUES
(1, 200000.00, '2023-01-01', 'Yearly report required', 'Active', 1),
(2, 150000.00, '2022-07-15', 'Monthly check-ins', 'Active', 2),
(3, 120000.00, '2023-05-12', 'Final report due', 'Pending', 3),
(4, 250000.00, '2023-08-01', 'Quarterly updates', 'Active', 4),
(5, 100000.00, '2023-02-20', 'Annual review', 'Pending', 5),
(6, 175000.00, '2021-04-01', 'Bi-annual review', 'Complete', 6),
(7, 90000.00, '2022-01-15', 'Final data submission', 'Active', 7),
(8, 300000.00, '2021-07-01', 'Annual review', 'Active', 8),
(9, 130000.00, '2023-02-01', 'Financial review', 'Active', 9),
(10, 210000.00, '2023-03-01', 'Data submission', 'Pending', 10);

INSERT INTO `cs_vya95458`.`Project_has_CollaboratingInstitution` (`idProject`, `idCollab`, `collabRole`) VALUES
(1, 1, 'Technical Advisor'),
(2, 2, 'Funding Partner'),
(3, 3, 'Research Collaborator'),
(4, 4, 'Data Provider'),
(5, 5, 'Logistics Support'),
(6, 6, 'Joint Research'),
(7, 7, 'Field Specialist'),
(8, 8, 'Medical Expert'),
(9, 9, 'Financial Analyst'),
(10, 10, 'AI Consultant');

INSERT INTO `cs_vya95458`.`CollaboratingInstitution` (`idCollab`, `institutionName`, `country`, `partnershipDate`, `expertiseField`) VALUES
(1, 'MIT', 'USA', '2023-01-15', 'AI and Machine Learning'),
(2, 'Stanford University', 'USA', '2022-06-10', 'Physics and Quantum Mechanics'),
(3, 'Harvard University', 'USA', '2023-04-01', 'Organic Chemistry'),
(4, 'Oxford University', 'UK', '2023-02-18', 'Genetics'),
(5, 'Cambridge University', 'UK', '2022-12-25', 'Mathematics'),
(6, 'University of Toronto', 'Canada', '2021-05-15', 'Civil Engineering'),
(7, 'UC Berkeley', 'USA', '2022-01-30', 'Environmental Science'),
(8, 'Johns Hopkins University', 'USA', '2021-07-15', 'Medical Research'),
(9, 'London School of Economics', 'UK', '2023-03-22', 'Economics'),
(10, 'University of Tokyo', 'Japan', '2023-03-10', 'AI in Healthcare');

select
    Project.projectTitle AS project_title,
    Project.startDate,
    Project.endDate,
    Grants.grantAmount AS total_grant_amount,
    Project.budget AS used_budget,
    (Grants.grantAmount - Project.budget) AS remaining_balance
from
    Project, Grants
where
    Project.idProject = Grants.idProject
and
    Project.startDate <= '2024-11-17' AND Project.endDate >= '2024-11-17'
ORDER BY 
    remaining_balance DESC;



SELECT 
    Researcher.name AS ResearcherName,
    Project.projectTitle AS ProjectTitle,
    IFNULL(SUM(Grants.grantAmount), 0) AS TotalGrantFunding
FROM 
    Researcher
JOIN 
    Project_has_Researcher ON Researcher.idResearcher = Project_has_Researcher.idResearcher
JOIN 
    Project ON Project_has_Researcher.idProject = Project.idProject
LEFT JOIN 
    Grants ON Project.idProject = Grants.idProject
GROUP BY 
    Researcher.name, Project.projectTitle
ORDER BY 
    Researcher.name, Project.projectTitle;

select * from Department;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
