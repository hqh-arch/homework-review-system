-- 已安装作业评阅功能的数据库执行一次；新安装只需执行 homework.sql。
ALTER TABLE hw_assignment ADD COLUMN deleted_at DATETIME NULL;
ALTER TABLE hw_submission ADD COLUMN returned_at DATETIME NULL, ADD COLUMN return_reason TEXT NULL;
