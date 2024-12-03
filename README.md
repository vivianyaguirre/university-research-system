# University-Research-System
# Team Name:
Data Dash
# Team Members:
1. Vivian Aguirre @vivianyaguirre
2. Lindsey Rubury @lindseyrubury
3. Sanvi Mamidipalli @sanvimam
# Scenario Description:
This data model represents the operational structure of a research organization, focusing on managing projects, researchers, equipment, funding, and collaborations. It tracks the lifecycle of research projects, including researcher roles, equipment usage, funding sources, and collaborations with external institutions, while also maintaining information on publications and datasets generated. Researchers are assigned specific roles, with their contributions tracked over time, and departments oversee projects, managing budgets and resources to ensure effective operations. The system supports grant management by linking projects to funding sources, detailing grant conditions, amounts, and statuses. Collaborative institutions contribute expertise or resources, while equipment usage is logged to ensure maintenance and availability. Publications and datasets are tied to projects, providing a comprehensive view of research outcomes and contributions to the scientific community. This model streamlines research operations, enabling effective resource management, collaboration, and performance monitoring, while offering insights into funding, resource utilization, and research outputs.
# Data Model:
![University RS Model](University-RS-Model.png)

The database model provides a robust framework to manage research activities by integrating relationships across projects, departments, researchers, equipment, funding, collaborations, outputs, and hierarchies. At its core, the Project entity serves as the central hub, capturing key information such as project titles, budgets, timelines, and departmental oversight.

### 1. Projects and Departments Relationship: 
Each project is associated with a department, represented through the relationship between the Project and Department entities. Departments oversee projects, manage resources like budgets, and provide locations for execution. This one-to-many relationship ensures that multiple projects can be supported by a single department, but each project is directly accountable to one department. 
### 2. Projects and Researchers Relationship:
Researchers are assigned specific roles in projects, with their involvement tracked through the Project_has_Researcher table. This many-to-many relationship links researchers to projects and records their roles, contributions, and timelines, ensuring comprehensive personnel management. Researchers are further connected to their departments, facilitating broader organizational tracking. The hierarchical structure among researchers is supported through a self-referential "Reports To" relationship within the Researcher entity, enabling the management of reporting chains and team leadership.
### 3. Projects and Equipment Relationship:
The use of equipment by projects is managed through the ProjectEquipment table, which establishes a many-to-many relationship between the Project and Equipment entities. This table captures equipment usage details, including start and end dates, maintenance costs, and availability, ensuring efficient resource allocation and proper planning.
### 4. Projects and Funding Relationship:
Projects are linked to funding through the Grants entity, which stores information on grant amounts, conditions, and statuses. This one-to-many relationship allows a project to receive multiple grants, although it is not mandatory for a project to have one. The FundingSource entity captures additional details about the sources of funding, such as their names, types, and total contributions, enabling transparent and detailed financial trackin
### 5. Projects and Collaborating Institutions Relationship:
Collaborations with external institutions are tracked using the "Project_has_CollaboratingInstitution" table, which connects the "Project" entity to the "CollaboratingInstitution" entity. This table records the role and nature of the collaboration, such as expertise provided or resources shared.
### 6. Projects and Publications Relationship:
The outcomes of research projects, such as publications, are captured through the "Publication" entity. This table links publications to specific projects and records details like publication titles, dates, journals, and citation counts.
### 7. Projects and Datasets Relationship:
Datasets generated during research activities are connected to projects through the "Dataset" entity. This table stores details about datasets, including titles, formats, accessibility, and collection dates, ensuring a comprehensive record of research outputs.
### 8. Researchers and Reporting Relationship:
The "Researcher" entity includes a self-referential relationship ("Reports To"), allowing the organization to track reporting hierarchies among researchers. This supports effective team management and organizational oversight.
### 9. Equipment Maintenance and Availability:
The "Equipment" entity tracks details such as equipment name, maintenance cost, and availability status, ensuring proper resource management and allocation for ongoing projects.
# Data Dictionary:
### Project Table
<img width="615" alt="Screenshot 2024-12-02 at 11 31 40 PM" src="https://github.com/user-attachments/assets/045fc185-5dd2-4400-a830-c9f34743cc00">

### Researcher Table
<img width="615" alt="Screenshot 2024-12-02 at 11 33 15 PM" src="https://github.com/user-attachments/assets/f5fb2c9b-161d-4988-a8d8-b6d60d0ebf45">

### Equipment Table
<img width="615" alt="Screenshot 2024-12-02 at 11 33 44 PM" src="https://github.com/user-attachments/assets/251479bd-23c1-41de-8597-b89ac6e9d146">

### Grants Table
<img width="615" alt="Screenshot 2024-12-02 at 11 34 25 PM" src="https://github.com/user-attachments/assets/10348723-8836-4ed4-8069-f1a9bf99e66b">

### Publication Table
<img width="615" alt="Screenshot 2024-12-02 at 11 35 10 PM" src="https://github.com/user-attachments/assets/eda39913-3a23-47e1-83ff-c21222a34c1d">

### Collaborating Institution Table
<img width="615" alt="Screenshot 2024-12-02 at 11 37 22 PM" src="https://github.com/user-attachments/assets/8eba586e-1e55-41bb-9cb3-971496363e3b">

### Department Table
<img width="615" alt="Screenshot 2024-12-02 at 11 40 01 PM" src="https://github.com/user-attachments/assets/88c5df89-e734-451a-97e9-adfa25cf1e95">

### Dataset Table
<img width="615" alt="Screenshot 2024-12-02 at 11 40 55 PM" src="https://github.com/user-attachments/assets/e8c9fcd1-653b-47ec-884f-85d3b9aea0e6">

### Funding Source Table
<img width="615" alt="Screenshot 2024-12-02 at 11 42 42 PM" src="https://github.com/user-attachments/assets/c1af0968-fccb-437d-9869-28d5a050a4cd">

### Project_has_Researcher Table
<img width="615" alt="Screenshot 2024-12-02 at 11 43 29 PM" src="https://github.com/user-attachments/assets/027c2fd7-892d-48e8-abd1-f0bb1e315a90">

### Project_has_Collaborating Institution Table
<img width="615" alt="Screenshot 2024-12-02 at 11 44 41 PM" src="https://github.com/user-attachments/assets/30c5b113-1634-4f9c-8b50-7d751d542385">

### ProjectEquipment
<img width="612" alt="Screenshot 2024-12-02 at 11 46 09 PM" src="https://github.com/user-attachments/assets/09039a5c-c39a-485d-b17a-aa56e522539e">

# Queries for Insight:

# Tableau Visualizations and Dashboard:
## Visualization - Query #1:
<img width="909" alt="Screenshot 2024-12-03 at 12 19 42 AM" src="https://github.com/user-attachments/assets/a6c15ac7-8776-4004-9b1e-ff0c5edabc4e">

### Description:




## Visualization - Query #2:
<img width="942" alt="Screenshot 2024-12-03 at 12 11 31 AM" src="https://github.com/user-attachments/assets/d5d92260-d407-4fd0-a03e-636d54fe6f16">

### Description:
This bar chart, titled "Grant Funding by Research Project", visualizes the total grant funding allocated to various research projects. The x-axis represents the project titles, while the y-axis indicates the total funding amounts in USD. Each bar corresponds to a specific research project, with its height reflecting the funding received. The visualization highlights projects such as "Cancer Research," "Genetics Study," and "Machine Learning in Healthcare" as having received higher levels of funding compared to others like "Climate Change" and "Number Theory."
### Justification:
This visualization effectively highlights the distribution of grant funding across various research projects, making it easy to compare funding levels at a glance. By using a bar chart, the visualization provides a clear and intuitive way to identify the most and least funded projects, such as "Cancer Research" and "Genetics Study" receiving the highest funding, while areas like "Climate Change" receive less. This allows stakeholders to quickly assess funding priorities and make informed decisions about reallocating resources or justifying current allocations, ensuring alignment with organizational goals and research priorities.

















