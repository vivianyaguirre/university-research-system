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

This data model represents a relational structure for managing research operations within an organization. It supports the storage and organization of various entities related to projects, researchers, equipment, funding, publications, datasets, and collaborations. Below is a breakdown of how data is structured and the relationships between entities.

### 1. Projects and Departments Relationship: 
Each project is associated with a department, represented by the relationship between the "Project" and "Department" entities. The "Department" entity oversees the projects and manages resources like budgets and locations, ensuring effective project execution.
### 2. Projects and Researchers Relationship:
Researchers are assigned specific roles within projects through the "Project_has_Researcher" entity. This table tracks the researchers' roles, contributions, and the duration of their involvement in each project. Researchers themselves are connected to their departments, enabling tracking of their broader affiliations.
### 3. Projects and Equipment Relationship:
Projects utilize various equipment, and this relationship is captured by the "ProjectEquipment" entity. It connects the "Project" and "Equipment" entities, detailing the start and end dates of equipment usage, as well as its availability and maintenance status.
### 4. Projects and Funding Relationship:
Projects are linked to funding through the "Grants" entity. This table details the grant amount, conditions, status, and the funding source, which is captured in the "FundingSource" entity. This allows the organization to monitor funding sources and their contributions to specific projects.
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
<img width="411" alt="Screenshot 2024-12-02 at 11 25 20 PM" src="https://github.com/user-attachments/assets/74a70124-2415-4ef8-97a1-370d29c2cd5a">
# Data Dictionary:
### Project Table
<img width="615" alt="Screenshot 2024-12-02 at 11 31 40 PM" src="https://github.com/user-attachments/assets/045fc185-5dd2-4400-a830-c9f34743cc00">

### Researcher Table
<img width="615" alt="Screenshot 2024-12-02 at 11 33 15 PM" src="https://github.com/user-attachments/assets/f5fb2c9b-161d-4988-a8d8-b6d60d0ebf45">

### Department Table

### Equipment Table
<img width="615" alt="Screenshot 2024-12-02 at 11 33 44 PM" src="https://github.com/user-attachments/assets/251479bd-23c1-41de-8597-b89ac6e9d146">

### Grants Table
<img width="615" alt="Screenshot 2024-12-02 at 11 34 25 PM" src="https://github.com/user-attachments/assets/10348723-8836-4ed4-8069-f1a9bf99e66b">

### Publication Table
<img width="615" alt="Screenshot 2024-12-02 at 11 35 10 PM" src="https://github.com/user-attachments/assets/eda39913-3a23-47e1-83ff-c21222a34c1d">

### Collaborating Institution Table
<img width="615" alt="Screenshot 2024-12-02 at 11 37 22 PM" src="https://github.com/user-attachments/assets/8eba586e-1e55-41bb-9cb3-971496363e3b">













