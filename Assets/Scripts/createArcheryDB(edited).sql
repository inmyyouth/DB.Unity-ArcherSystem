-- DROP TABLE IF EXISTS `validscore`;
-- DROP TABLE IF EXISTS `score`;
-- DROP TABLE IF EXISTS `archer`;
-- DROP TABLE IF EXISTS `category`;
-- DROP TABLE IF EXISTS `equipment`;
-- DROP TABLE IF EXISTS `round`;
-- DROP TABLE IF EXISTS `competition`;

CREATE TABLE `equipment`(
`equipmentID` INT NOT NULL AUTO_INCREMENT, 
`type` varchar(30) NOT NULL, 
`description` varchar(50) NOT NULL,
PRIMARY KEY (`equipmentID`)
); 

CREATE TABLE `competition`(
`competitionID` INT NOT NULL AUTO_INCREMENT, 
`name` varchar(50) NOT NULL, 
`date` DATE NOT NULL, 
`location` varchar(50) NOT NULL, 
`championship` boolean, 
PRIMARY KEY (`competitionID`)
);

CREATE TABLE `category`(
`categoryID` INT NOT NULL AUTO_INCREMENT, 
`description` varchar(50),
PRIMARY KEY(`categoryID`)
);

CREATE TABLE `archer`(
`archerID` INT NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL, 
`age` INT NOT NULL,
`gender` varchar(10) NOT NULL, 
`categoryID` INT NOT NULL,
PRIMARY KEY (`archerID`),
CONSTRAINT FOREIGN KEY (`categoryID`) REFERENCES category(`categoryID`)
);

CREATE TABLE `archer_category`(
`archerCatID` INT NOT NULL AUTO_INCREMENT, 
`archerID` INT NOT NULL, 
`equipmentID` INT NOT NULL, 
`competitionID` INT NOT NULL, 
`categoryID` INT NOT NULL,
PRIMARY KEY (`archerCatID`), 
CONSTRAINT FOREIGN KEY (`archerID`) REFERENCES archer(`archerID`),
CONSTRAINT FOREIGN KEY (`equipmentID`) REFERENCES equipment(`equipmentID`),
CONSTRAINT FOREIGN KEY (`competitionID`) REFERENCES competition(`competitionID`),
CONSTRAINT FOREIGN KEY (`categoryID`) REFERENCES category(`categoryID`)
);

-- alter table `archer`
-- add CONSTRAINT FOREIGN KEY (`categoryID`) REFERENCES category(`categoryID`);
CREATE TABLE `targetface`(
`targetFaceID` INT NOT NULL AUTO_INCREMENT, 
`targetDesc` varchar (30) NOT NULL,
PRIMARY KEY (`targetFaceID`)
);

CREATE TABLE `round`(
`roundID` INT NOT NULL AUTO_INCREMENT, 
`name` varchar(30) NOT NULL, 
`range` INT NOT NULL, 
`targetFaceID` INT NOT NULL, 
PRIMARY KEY (`roundID`),
CONSTRAINT FOREIGN KEY (`targetFaceID`) REFERENCES targetface(`targetFaceID`)
);

CREATE TABLE `score`(
`scoreID` INT NOT NULL AUTO_INCREMENT, 
`archerID` INT NOT NULL, 
`roundID` INT NOT NULL, 
`competitionID` INT NOT NULL,
`time` time NOT NULL, 
`categoryID` INT NOT NULL, 
`arrow1` INT NOT NULL, 
`arrow2` INT NOT NULL, 
`arrow3` INT NOT NULL, 
`arrow4` INT NOT NULL, 
`arrow5` INT NOT NULL, 
`arrow6` INT NOT NULL, 
`totalScore` INT NOT NULL,
PRIMARY KEY (`scoreID`),
CONSTRAINT FOREIGN KEY (`archerID`) REFERENCES archer(`archerID`),
CONSTRAINT FOREIGN KEY (`roundID`) REFERENCES round(`roundID`),
CONSTRAINT FOREIGN KEY (`competitionID`) REFERENCES competition(`competitionID`),
CONSTRAINT FOREIGN KEY (`categoryID`) REFERENCES archer_category(`archerCatID`)
); 

CREATE TABLE `recorder`(
`recorderID` INT NOT NULL AUTO_INCREMENT, 
`name` varchar(30) NOT NULL, 
PRIMARY KEY (`recorderID`)
);

CREATE TABLE `validscore`(
`recorderID` INT NOT NULL, 
`scoreID` INT NOT NULL, 
`finalScore` INT NOT NULL, 
PRIMARY KEY (`recorderID`, `scoreID`), 
CONSTRAINT FOREIGN KEY (`recorderID`) REFERENCES recorder(`recorderID`),
CONSTRAINT FOREIGN KEY (`scoreID`) REFERENCES score(`scoreID`)
);
