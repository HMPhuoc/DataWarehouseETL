<h2>SQL folder contains .sql file to create table used for ETL processes.</h2>
<ul> 
    <li>finalDimFact: creating dimensions and fact table.</li>
    <li>finalRawData: creating a raw data table for the ETL processes.</li>
</ul>

<b><h2>Data folder contains .xls file that contains data of the project.</h2>
<ul>
    <li>HDHI Admission data: data of hospital admission.</li>
    <li>HDMI Mortality data: data of death case.</li>
    <li>table_heading: name of colums and explaination.</li>
</ul>

<b><h2>FinalProjectETL contains the ETL project.</h2>
The project consists of many Control Flows in which has many Data Flows. Each of them EXTRACT the data from source, TRANSFORM and finally LOAD them into the existing tables of dimensions and facts. And here are the Flows:
<ul>
    For Admission&Diagnosis Control Flow:
    <li>RawData: Import data from Excel file to RawData table</li>
    <li>TimeStaging: Staging data from RawData table to TimeStage table </li>
    <li>AnaemiaStaging: Staging data from RawData table to AnaemiaStage table</li>
    <li>HabbitStaging: Staging data from RawData table to HabbitStage table</li>
    <li>PersonStaging: Staging data from RawData table to PersonStage table</li>
    <li>PersonHealthStaging: Staging data from RawData table to PersonalHealthStage table</li>
    <li>DiagnosisStaging: Staging data from RawData table to DiagnosisStage table</li>
    <li>Admission&DiagnosisStaging: Staging data from RawData table to AdmissionFactStage and DiagnosisFactStage table</li>
    For Deathcase Control Flow:
    <li>RawData: Import data from Excel file to RawDeathData table</li>
    <li>DeathPersonStaging: Staging data from RawDeathData table to DeathPersonStage table</li>
    <li>DeathStaging: Staging data from RawDeathData table to DeathStage table</li>
    For DataWarehouse Control Flow:
    <li>AddToDimension: add data from every staging dimension table to datawarehouse dimension table</li>
    <li>AddToFact: add data from every staging fact table to datawarehouse fact table</li>
</ul> 

<h2>Modify the PATH of the Excel Connection carfully. Should use the 2007-2010 instead of the 97-2003</h2>
