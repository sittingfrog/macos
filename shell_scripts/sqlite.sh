brew install sqlite

# sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'UPDATE access SET allowed = "1";'


# sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'DESCRIBE;'

# sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" "SELECT * FROM access;"

# kTCCServiceDeveloperTool|com.apple.Terminal          |0|0|4|1|||0|UNUSED||0|1618698162
# kTCCServiceSystemPolicyAllFiles|com.googlecode.iterm2|0|2|4|1|||0|UNUSED||0|1618972014
# 
# table|access|access|9|
# CREATE TABLE access (    
# 
# 	service        TEXT        NOT NULL,     
# 	client         TEXT        NOT NULL,     
# 	client_type    INTEGER     NOT NULL,     
# 	auth_value     INTEGER     NOT NULL,     
# 	auth_reason    INTEGER     NOT NULL,     
# 	auth_version   INTEGER     NOT NULL,     
# 	csreq          BLOB,     
# 	policy_id      INTEGER,     
# 	indirect_object_identifier_type    INTEGER,     
# 	indirect_object_identifier         TEXT NOT NULL DEFAULT 'UNUSED',     
# 	indirect_object_code_identity      BLOB,     
# 	flags          INTEGER,     
# 	last_modified  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     
# 	PRIMARY KEY (service, client, client_type, indirect_object_identifier),    
# 	FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)