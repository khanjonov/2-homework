
CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);


CREATE TABLE Employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);


CREATE TABLE Projects (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);


CREATE TABLE Tasks (
    id SERIAL PRIMARY KEY,
    description TEXT,
    project_id INT,
    employee_id INT,
    FOREIGN KEY (project_id) REFERENCES Projects(id),
    FOREIGN KEY (employee_id) REFERENCES Employees(id)
);

-- tasks 2

ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);


ALTER TABLE Tasks
ALTER COLUMN description TYPE VARCHAR(255);

-- tasks 3


UPDATE Employees
SET position = 'Senior Developer'
WHERE id = 1;


UPDATE Projects
SET title = 'New Project Title'
WHERE id = 2;


DELETE FROM Projects
WHERE id = 3;


DELETE FROM Employees
WHERE id = 4;


ALTER TABLE Tasks
DROP CONSTRAINT tasks_employee_id_fkey,
ADD CONSTRAINT tasks_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES Employees(id) ON DELETE SET NULL;

