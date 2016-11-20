class CreateFunctions < ActiveRecord::Migration
  def change
  
  	sql = "CREATE OR REPLACE FUNCTION to_ascii(bytea, name) RETURNS text STRICT AS 'to_ascii_encname' LANGUAGE internal IMMUTABLE"

  	ActiveRecord::Base.connection.execute(sql)


  	sql = "CREATE OR REPLACE FUNCTION norm(a_string text) RETURNS text AS $$ 
  	BEGIN 
  		RETURN lower(to_ascii(convert_to(a_string, 'latin1'), 'latin1'));
  	END
	$$ LANGUAGE plpgsql
	IMMUTABLE"

  	ActiveRecord::Base.connection.execute(sql)


  end
end
