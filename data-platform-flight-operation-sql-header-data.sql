CREATE TABLE `data_platform_flight_operation_header_data`
(
  `Airway`                       int(16) NOT NULL,
  `OperationDate`                date NOT NULL,
  `FlightOperationID`            int(4) NOT NULL,
  `FlightOperationVersion`       int(4) NOT NULL,
  `PlannedFlightOperationID`     int(4) NOT NULL,
  `DepartureAirport`             int(16) NOT NULL,
  `DestinationAirport`           int(16) NOT NULL,
  `PlannedDepartureDate`         date NOT NULL,
  `PlannedDepartureTime`         time NOT NULL,
  `PlannedArrivalDate`           date NOT NULL,
  `PlannedArrivalTime`           time NOT NULL,
  `ActualDepartureDate`          date NOT NULL,
  `ActualDepartureTime`          time NOT NULL,
  `ActualArrivalDate`            date NOT NULL,
  `ActualArrivalTime`            time NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `OperationCode`                varchar(40) DEFAULT NULL,
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

    PRIMARY KEY (`Airway`, `OperationDate`, `FlightOperationID`),

    CONSTRAINT `DPFMFlightOperationHeaderData_fk` FOREIGN KEY (`Airway`) REFERENCES `data_platform_airway_header_data` (`Airway`),
    CONSTRAINT `DPFMFlightOperationHeaderDataPlannedID_fk` FOREIGN KEY (`Airway`, `FlightOperationVersion`, `PlannedFlightOperationID`) REFERENCES `data_platform_planned_flight_operation_header_data` (`Airway`, `FlightOperationVersion`, `PlannedFlightOperationID`),
    CONSTRAINT `DPFMFlightOperationHeaderDataDptAirport_fk` FOREIGN KEY (`DepartureAirport`) REFERENCES `data_platform_airport_header_data` (`Airport`),
    CONSTRAINT `DPFMFlightOperationHeaderDataDstAirport_fk` FOREIGN KEY (`DestinationAirport`) REFERENCES `data_platform_airport_header_data` (`Airport`),
    CONSTRAINT `DPFMFlightOperationHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMFlightOperationHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
