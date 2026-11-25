-- 在现有数据库执行；用系统用户 ID 和现有班级 ID 配置成员。
CREATE TABLE IF NOT EXISTS hw_member (user_id BIGINT NOT NULL, class_id VARCHAR(64) NOT NULL, role VARCHAR(10) NOT NULL, PRIMARY KEY(user_id,class_id,role));
CREATE TABLE IF NOT EXISTS hw_assignment (id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, class_id VARCHAR(64) NOT NULL, teacher_id BIGINT NOT NULL, title VARCHAR(200) NOT NULL, description TEXT, deadline DATETIME NULL, created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, deleted_at DATETIME NULL);
CREATE TABLE IF NOT EXISTS hw_submission (id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, assignment_id BIGINT NOT NULL, student_id BIGINT NOT NULL, content MEDIUMTEXT NOT NULL, version INT NOT NULL DEFAULT 1, submitted_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, score DECIMAL(5,2), comment TEXT, annotations MEDIUMTEXT, graded_at DATETIME NULL, returned_at DATETIME NULL, return_reason TEXT, UNIQUE KEY assignment_student (assignment_id,student_id));
-- 示例（将 ID 替换为真实值）：
-- INSERT INTO hw_member VALUES (教师用户ID, '班级ID', 'teacher'), (学生用户ID, '班级ID', 'student');
