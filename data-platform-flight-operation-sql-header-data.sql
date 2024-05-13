CREATE TABLE `data_platform_flight_operation_header_data`
(
  `Airway`                       int(16) NOT NULL,
  `FlightOperationVersion`       int(4) NOT NULL,
  `FlightOperationID`            int(4) NOT NULL,
  `DepartureAirport`             int(16) NOT NULL,
  `DestinationAirport`           int(16) NOT NULL,
  `DepartingDate`                date(16) NOT NULL,
  `DepartingTime`                time(16) NOT NULL,
  `ArrivingDate`                 date(16) NOT NULL,
  `ArrivingTime`                 time(16) NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Airway`, `FlightOperationVersion`, `FlightOperationID`),

    CONSTRAINT `DPFMFlightOperationHeaderData_fk` FOREIGN KEY (`Airway`) REFERENCES `data_platform_airway_header_data` (`Airway`),
    CONSTRAINT `DPFMFlightOperationHeaderDataDptAirport_fk` FOREIGN KEY (`DepartureAirport`) REFERENCES `data_platform_airport_header_data` (`Airport`),
    CONSTRAINT `DPFMFlightOperationHeaderDataDstAirport_fk` FOREIGN KEY (`DestinationAirport`) REFERENCES `data_platform_airport_header_data` (`Airport`),
    CONSTRAINT `DPFMFlightOperationHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMFlightOperationHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
