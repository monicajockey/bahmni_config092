
SELECT TOTALS_COLS_ROWS.AgeGroup        
		, TOTALS_COLS_ROWS.Routine_VL_Accepted_Males 
		, TOTALS_COLS_ROWS.Routine_VL_Accepted_Females 
		, TOTALS_COLS_ROWS.Routine_VL_Denied_Males 
		, TOTALS_COLS_ROWS.Routine_VL_Denied_Females 
		, TOTALS_COLS_ROWS.Targeted_VL_Accepted_Males 
		, TOTALS_COLS_ROWS.Targeted_VL_Accepted_Females 
		, TOTALS_COLS_ROWS.Targeted_VL_Denied_Males 
		, TOTALS_COLS_ROWS.Targeted_VL_Denied_Females  
		,TOTALS_COLS_ROWS.Linked_Accepted_Males 
		,TOTALS_COLS_ROWS.Linked_Accepted_Females  
		, TOTALS_COLS_ROWS.Linked_Denied_Males 
		, TOTALS_COLS_ROWS.Linked_Denied_Females   
		, TOTALS_COLS_ROWS.Not_Linked_Accepted_Males 
		, TOTALS_COLS_ROWS.Not_Linked_Accepted_Females  
		, TOTALS_COLS_ROWS.Not_Linked_Denied_Males 
		, TOTALS_COLS_ROWS.Not_Linked_Denied_Females  
		, TOTALS_COLS_ROWS.Referred_Accepted_Males 
		, TOTALS_COLS_ROWS.Referred_Accepted_Females  
		, TOTALS_COLS_ROWS.Referred_Denied_Males 
		, TOTALS_COLS_ROWS.Referred_Denied_Females
		, TOTALS_COLS_ROWS.Total  								

FROM (

(SELECT INDEX_STATUS_DRVD_ROWS.age_group AS 'AgeGroup'  

						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Routine' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Routine_VL_Accepted_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Routine' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Routine_VL_Accepted_Females 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Routine' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Routine_VL_Denied_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Routine' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Routine_VL_Denied_Females 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Targeted' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Targeted_VL_Accepted_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Targeted' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Targeted_VL_Accepted_Females 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Targeted' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Targeted_VL_Denied_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status > 20 AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HVL_Targeted' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Targeted_VL_Denied_Females  
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Linked_Accepted_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Linked_Accepted_Females  
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Linked_Denied_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Linked_Denied_Females   
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Not_Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Not_Linked_Accepted_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Not_Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Not_Linked_Accepted_Females  
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Not_Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Not_Linked_Denied_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Not_Linked' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Not_Linked_Denied_Females  
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Referred' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Referred_Accepted_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Referred' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Accepted' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Referred_Accepted_Females  
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Referred' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'M', 1, 0))) AS Referred_Denied_Males 
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0, SUM(IF(INDEX_STATUS_DRVD_ROWS.Patient_Health_Status = 'Referred' AND INDEX_STATUS_DRVD_ROWS.Client_Program = 'HTS' AND INDEX_STATUS_DRVD_ROWS.Indexing = 'Denied' AND INDEX_STATUS_DRVD_ROWS.Gender = 'F', 1, 0))) AS Referred_Denied_Females  
										
						, IF(INDEX_STATUS_DRVD_ROWS.Id IS NULL, 0,  SUM(1)) as 'Total' 
						, INDEX_STATUS_DRVD_ROWS.sort_order
			FROM (  
				
				
-- ART CLIENTS WITH HVL AND ACCEPTED INDEXING WITH MONITORING TYPE ROUTINE
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name', Age, Gender, age_group, vl_result AS 'Patient_Health_Status','HVL_Routine' as 'Client_Program','Accepted' AS 'Indexing', sort_order
FROM  
		 
						(select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   observed_age_group.name AS age_group,
											   o.value_numeric AS vl_result,
											   observed_age_group.sort_order AS sort_order

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS 
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										-- ROUTINE VL MONITORING TYPE ROUTINE
										and os.value_coded = 4281
								)	
								--  ROUTINE VL MONITORING TYPE ROUTINE AND ACCEPTED INDEXING					 
								AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2146
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								INNER JOIN reporting_age_group AS observed_age_group ON
									CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
									AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
						    WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
		ORDER BY INDEX_CLIENTS.Age)  

UNION

-- ART CLIENTS WITH HVL AND DENIED INDEXING WITH MONITORING TYPE ROUTINE
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name', Age, Gender, age_group, vl_result AS 'Patient_Health_Status','HVL_Routine' as 'Client_Program','Denied' AS 'Indexing', sort_order
FROM  
		 
						(select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   observed_age_group.name AS age_group,
											   o.value_numeric AS vl_result,
											   observed_age_group.sort_order AS sort_order

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS 
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										-- ROUTINE VL MONITORING TYPE ROUTINE
										and os.value_coded = 4281
								)	
								--  ROUTINE VL MONITORING TYPE ROUTINE AND DENIED INDEXING					 
								AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2147
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								INNER JOIN reporting_age_group AS observed_age_group ON
									CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
									AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
						    WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
		ORDER BY INDEX_CLIENTS.Age)  

UNION 

-- ART CLIENTS WITH HVL AND ACCEPTED INDEXING WITH MONITORING TYPE TARGED
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, vl_result AS 'Patient_Health_Status','HVL_Targeted' as 'Client_Program','Accepted' AS 'Indexing', sort_order
FROM  
		 (select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   observed_age_group.name AS age_group,
											   o.value_numeric AS vl_result,
											   observed_age_group.sort_order AS sort_order

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										-- TARGETED VL MONITORING TYPE TARGETED
										and os.value_coded = 4282
								)
								 
								--  ROUTINE VL MONITORING TYPE TARGETED AND ACCEPTED INDEXING					 
					 			AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2146
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								INNER JOIN reporting_age_group AS observed_age_group ON
									CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
									AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
						    WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
		ORDER BY INDEX_CLIENTS.Age) 
		UNION

-- ART CLIENTS WITH HVL AND DENIED INDEXING WITH MONITORING TYPE TARGED
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, vl_result AS 'Patient_Health_Status','HVL_Targeted' as 'Client_Program','Denied' AS 'Indexing', sort_order
FROM  
		 (select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   observed_age_group.name AS age_group,
											   o.value_numeric AS vl_result,
											   observed_age_group.sort_order AS sort_order

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										-- TARGETED VL MONITORING TYPE TARGETED
										and os.value_coded = 4282
								)
								 
								--  ROUTINE VL MONITORING TYPE TARGETED AND DENIED INDEXING					 
					 			AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2147
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								INNER JOIN reporting_age_group AS observed_age_group ON
									CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
									AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
						    WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
		ORDER BY INDEX_CLIENTS.Age)  

UNION

-- CLIENTS TESTED POSITIVE AND LINKED TO CARE AND ACCEPTED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, 'Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Accepted' AS 'Indexing', sort_order
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender,
									   observed_age_group.name AS age_group,
									   observed_age_group.sort_order AS sort_order

                from obs o

						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )
						
						-- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- LINKED AND ACCEPTED INDEXING						 
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )						  
 						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 INNER JOIN reporting_age_group AS observed_age_group ON
						  CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
						  AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
                   WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
ORDER BY INDEX_CLIENTS.Age)

UNION 
-- CLIENTS TESTED POSITIVE AND LINKED TO CARE AND DENIED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, 'Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Denied' AS 'Indexing', sort_order
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender,
									   observed_age_group.name AS age_group,
									   observed_age_group.sort_order AS sort_order

                from obs o

						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- LINKED AND DENIED INDEXING						 
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )
						  
 						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 INNER JOIN reporting_age_group AS observed_age_group ON
						  CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
						  AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
                   WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
ORDER BY INDEX_CLIENTS.Age)

UNION

-- CLIENTS TESTED POSITIVE AND NOT LINKED TO CARE AND ACCEPTED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, 'Not_Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Accepted' AS 'Indexing', sort_order
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender,
									   observed_age_group.name AS age_group,
							          observed_age_group.sort_order AS sort_order

                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT NOT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )	
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- PATIENT NOT LINKED AND ACCEPTED INDEX	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )				 
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 INNER JOIN reporting_age_group AS observed_age_group ON
						 
						 CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
						  AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
                   WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
ORDER BY INDEX_CLIENTS.Age)

UNION

-- CLIENTS TESTED POSITIVE AND NOT LINKED TO CARE AND DENIED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, 'Not_Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Denied' AS 'Indexing', sort_order
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender,
									   observed_age_group.name AS age_group,
									   observed_age_group.sort_order AS sort_order

                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT NOT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )	
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- PATIENT NOT LINKED AND DENIED INDEX	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )				 
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 INNER JOIN reporting_age_group AS observed_age_group ON
						 
						 CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
						  AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
                   WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
ORDER BY INDEX_CLIENTS.Age)

UNION

-- CLIENTS TESTED POSITIVE AND REFFERED TO OTHER FACILITIES AND ACCEPTED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, 'Referred' AS 'Patient_Health_Status','HTS' as 'Client_Program','Accepted' AS 'Indexing', sort_order
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender,
									   observed_age_group.name AS age_group,
									   observed_age_group.sort_order AS sort_order
 
                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT REFERRED TO OTHER FACILITY
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2922
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 ) 
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )
						 
						 -- PATIENT NOT REFFERED AND ACCEPTED INDEXING	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )			
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 INNER JOIN reporting_age_group AS observed_age_group ON

						 CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
						 AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
                   WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
ORDER BY INDEX_CLIENTS.Age) 
 
UNION

-- CLIENTS TESTED POSITIVE AND REFFERED TO OTHER FACILITIES AND DENIED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, age_group, 'Referred' AS 'Patient_Health_Status','HTS' as 'Client_Program','Denied' AS 'Indexing', sort_order
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender,
									   observed_age_group.name AS age_group,
									   observed_age_group.sort_order AS sort_order
 
                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT REFERRED TO OTHER FACILITY
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2922
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 ) 
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )
						 
						 -- PATIENT NOT REFFERED AND DENIED INDEXING	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )			
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 INNER JOIN reporting_age_group AS observed_age_group ON

						 CAST('20200331' AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.min_years YEAR), INTERVAL observed_age_group.min_days DAY))
						 AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL observed_age_group.max_years YEAR), INTERVAL observed_age_group.max_days DAY))
                   WHERE observed_age_group.report_group_name = 'Modified_Ages') AS INDEX_CLIENTS
ORDER BY INDEX_CLIENTS.Age)

) AS INDEX_STATUS_DRVD_ROWS

GROUP by INDEX_STATUS_DRVD_ROWS.age_group
ORDER BY INDEX_STATUS_DRVD_ROWS.sort_order)

UNION ALL

	(SELECT 'Total' AS 'AgeGroup'              
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Routine' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Routine_VL_Accepted_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Routine' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Routine_VL_Accepted_Females 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Routine' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Routine_VL_Denied_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Routine' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Routine_VL_Denied_Females 

						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Targeted' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Targeted_VL_Accepted_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Targeted' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Targeted_VL_Accepted_Females 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Targeted' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Targeted_VL_Denied_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status > 20 AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HVL_Targeted' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Targeted_VL_Denied_Females  
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Linked_Accepted_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Linked_Accepted_Females  
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Linked_Denied_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Linked_Denied_Females   
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Not_Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Not_Linked_Accepted_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Not_Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Not_Linked_Accepted_Females  
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Not_Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Not_Linked_Denied_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Not_Linked' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Not_Linked_Denied_Females  
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Referred' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Referred_Accepted_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Referred' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Accepted' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Referred_Accepted_Females  
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Referred' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'M', 1, 0))) AS Referred_Denied_Males 
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0, SUM(IF(CLIENTS_OFFERED_INDEXING_COLS.Patient_Health_Status = 'Referred' AND CLIENTS_OFFERED_INDEXING_COLS.Client_Program = 'HTS' AND CLIENTS_OFFERED_INDEXING_COLS.Indexing = 'Denied' AND CLIENTS_OFFERED_INDEXING_COLS.Gender = 'F', 1, 0))) AS Referred_Denied_Females  
						, IF(CLIENTS_OFFERED_INDEXING_COLS.Id IS NULL, 0,  SUM(1)) as 'Total'  
						, 99 AS sort_order
			FROM (				

				
-- ART CLIENTS WITH HVL AND ACCEPTED INDEXING WITH MONITORING TYPE ROUTINE
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name', Age, Gender, vl_result AS 'Patient_Health_Status','HVL_Routine' as 'Client_Program','Accepted' AS 'Indexing'
FROM  
		 
						(select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   o.value_numeric AS vl_result

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS 
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										-- ROUTINE VL MONITORING TYPE ROUTINE
										and os.value_coded = 4281
								)	
								--  ROUTINE VL MONITORING TYPE ROUTINE AND ACCEPTED INDEXING					 
								AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2146
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								
								) AS ACCEPTED_INDEXING_COLS
							)  

UNION

-- ART CLIENTS WITH HVL AND DENIED INDEXING WITH MONITORING TYPE ROUTINE
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name', Age, Gender, vl_result AS 'Patient_Health_Status','HVL_Routine' as 'Client_Program','Denied' AS 'Indexing'
FROM  
		 
						(select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   o.value_numeric AS vl_result

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS 
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										-- ROUTINE VL MONITORING TYPE ROUTINE
										and os.value_coded = 4281
								)	
								--  ROUTINE VL MONITORING TYPE ROUTINE AND DENIED INDEXING					 
								AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2147
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								) AS ACCEPTED_INDEXING_COLS
						)  

UNION 

-- ART CLIENTS WITH HVL AND ACCEPTED INDEXING WITH MONITORING TYPE TARGED
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, vl_result AS 'Patient_Health_Status','HVL_Targeted' as 'Client_Program','Accepted' AS 'Indexing'
FROM  
		 (select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   o.value_numeric as vl_result

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										-- TARGETED VL MONITORING TYPE TARGETED
										and os.value_coded = 4282
								)
								 
								--  ROUTINE VL MONITORING TYPE TARGETED AND ACCEPTED INDEXING					 
					 			AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2146
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								
								) AS ACCEPTED_INDEXING_COLS
						) 
		UNION

-- ART CLIENTS WITH HVL AND DENIED INDEXING WITH MONITORING TYPE TARGED
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, vl_result AS 'Patient_Health_Status','HVL_Targeted' as 'Client_Program','Denied' AS 'Indexing'
FROM  
		 (select distinct patient.patient_id AS Id,
											   patient_identifier.identifier AS patientIdentifier,
											   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
											   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
											   person.gender AS Gender,
											   o.value_numeric AS vl_result

						from obs o
								-- CLIENTS WITH A VIRAL LOAD RESULT DOCUMENTED WITHIN THE LAST 12 MONTHS
								INNER JOIN patient ON o.person_id = patient.patient_id
								AND o.concept_id = 2254 and o.voided=0
								AND o.obs_id in (
										select os.obs_id
										from obs os
										where os.concept_id=2254
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 2254 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										) 
										and os.value_numeric > 20
								)
								AND person_id in (
										select os.person_id
										from obs os
										where os.concept_id=4280
										and os.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
										and os.obs_datetime in (
												select max(oss.obs_datetime)
												from obs oss inner join person p on oss.person_id=p.person_id and oss.concept_id = 4280 and oss.voided=0
												and oss.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
												group by p.person_id
										)
										-- TARGETED VL MONITORING TYPE TARGETED
										and os.value_coded = 4282
								)
								 
								--  ROUTINE VL MONITORING TYPE TARGETED AND DENIED INDEXING					 
					 			AND o.person_id in (
									select distinct os.person_id
									from obs os
									where os.concept_id = 4759 and os.value_coded = 2147
									AND os.voided = 0
									AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
								)
								AND o.obs_datetime BETWEEN DATE(DATE_ADD(CAST('20200331' AS DATE), INTERVAL -12 MONTH)) AND CAST('20200331' AS DATE)
								INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
								INNER JOIN person_name ON person.person_id = person_name.person_id
								INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
								
								) AS ACCEPTED_INDEXING_COLS
							)  

UNION

-- CLIENTS TESTED POSITIVE AND LINKED TO CARE AND ACCEPTED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, 'Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Accepted' AS 'Indexing'
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender 

                from obs o

						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )
						
						-- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- LINKED AND ACCEPTED INDEXING						 
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )						  
 						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 
						 ) AS ACCEPTED_INDEXING_COLS
				   )

UNION 
-- CLIENTS TESTED POSITIVE AND LINKED TO CARE AND DENIED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, 'Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Denied' AS 'Indexing'
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender

                from obs o

						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- LINKED AND DENIED INDEXING						 
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )
						  
 						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 
						 ) AS ACCEPTED_INDEXING_COLS
				   )

UNION

-- CLIENTS TESTED POSITIVE AND NOT LINKED TO CARE AND ACCEPTED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, 'Not_Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Accepted' AS 'Indexing'
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender

                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT NOT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )	
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- PATIENT NOT LINKED AND ACCEPTED INDEX	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )				 
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 
						 ) AS ACCEPTED_INDEXING_COLS
				   )

UNION

-- CLIENTS TESTED POSITIVE AND NOT LINKED TO CARE AND DENIED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, 'Not_Linked' AS 'Patient_Health_Status','HTS' as 'Client_Program','Denied' AS 'Indexing'
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender

                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT NOT LINKED TO CARE
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )	
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )

						 -- PATIENT NOT LINKED AND DENIED INDEX	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )				 
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						 ) AS ACCEPTED_INDEXING_COLS
				   )

UNION

-- CLIENTS TESTED POSITIVE AND REFFERED TO OTHER FACILITIES AND ACCEPTED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, 'Referred' AS 'Patient_Health_Status','HTS' as 'Client_Program','Accepted' AS 'Indexing'
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender 
 
                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT REFERRED TO OTHER FACILITY
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2922
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 ) 
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )
						 
						 -- PATIENT NOT REFFERED AND ACCEPTED INDEXING	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2146
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )			
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						
						) AS ACCEPTED_INDEXING_COLS
				   ) 
 
UNION

-- CLIENTS TESTED POSITIVE AND REFFERED TO OTHER FACILITIES AND DENIED INDEXING
(SELECT Id, patientIdentifier AS 'Patient Identifier', patientName AS 'Patient Name',  Age, Gender, 'Referred' AS 'Patient_Health_Status','HTS' as 'Client_Program','Denied' AS 'Indexing'
FROM
                (select distinct patient.patient_id AS Id,
									   patient_identifier.identifier AS patientIdentifier,
									   concat(person_name.given_name, ' ', person_name.family_name) AS patientName,
									   floor(datediff(CAST('20200331' AS DATE), person.birthdate)/365) AS Age,
									   person.gender AS Gender 
 
                from obs o
						-- HTS CLIENTS WITH POSITIVE HIV STATUS BY SEX AND AGE
						 INNER JOIN patient ON o.person_id = patient.patient_id 
						 AND o.concept_id = 2165 AND o.value_coded = 1738
						 AND patient.voided = 0 AND o.voided = 0
						 AND o.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 
						 -- PATIENT REFERRED TO OTHER FACILITY
						 AND o.person_id in (
							select distinct os.person_id 
							from obs os
							where os.concept_id = 4239 and os.value_coded = 2922
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 ) 
						 -- EXCLUDE PATIENT THAT HAS TESTED NEGATIVE
						 AND o.person_id not in(
							 select distinct os.person_id
							from obs os
							where os.concept_id = 2165 and os.value_coded = 1016
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)							 
						 )
						 
						 -- PATIENT NOT REFFERED AND DENIED INDEXING	
						 AND o.person_id in (
							select distinct os.person_id
							from obs os
							where os.concept_id = 4759 and os.value_coded = 2147
							AND os.voided = 0
							AND os.obs_datetime BETWEEN CAST('20200301' AS DATE) AND CAST('20200331' AS DATE)
						 )			
						 
						 INNER JOIN person ON person.person_id = patient.patient_id AND person.voided = 0
						 INNER JOIN person_name ON person.person_id = person_name.person_id
						 INNER JOIN patient_identifier ON patient_identifier.patient_id = person.person_id AND patient_identifier.identifier_type = 3
						  
						 ) AS ACCEPTED_INDEXING_COLS
						 )  
 
				
        ) AS CLIENTS_OFFERED_INDEXING_COLS
    )

) AS TOTALS_COLS_ROWS

ORDER BY TOTALS_COLS_ROWS.sort_order
