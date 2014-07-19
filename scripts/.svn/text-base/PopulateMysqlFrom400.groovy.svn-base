import groovy.sql.Sql

Sql iSeries = Sql.newInstance("jdbc:as400://10.2.0.211/hrixpgle;naming=sql;errors=full;", "don", "vo2max", "com.ibm.as400.access.AS400JDBCDriver")
Sql mysql   = Sql.newInstance("jdbc:mysql://localhost/hrixpgle", "donat", "vo2max", "com.mysql.jdbc.Driver")

def tableMap = [ 
        	  'hrpeins':'hrixpgle',   // 20
        	  'prpaeded':'hrixpgle', // 100 (but limited....
        	  'prpmded':'hrixpgle', // 100 (but limited....
        	  'prpmst':'hrixpgle', // 64 
			  'hrpdeps':'hrixpgle',
        	  'prpecntax':'hrixpgle',  // 6
        	  'prpecnt':'hrixpgle',  // 5
			  'hrpjcls':'hrixpgle',
			  'xxpuser':'hrixpgle',
			  'prphpay':'hrixpgle',
			  'prphearn':'hrixpgle',
			  'prphoth':'hrixpgle',
			  'prppcon':'hrixpgle',
			  'prpconst':'hrixpgle'
              ]

mysql.execute("SET FOREIGN_KEY_CHECKS=0".toString())     
tableMap.each {file, library -> 
    try {
		mysql.execute("delete from $file".toString())     
    } catch (e) {
		println e
    }
}
tableMap.each {file, library -> 
    println "processing $library.$file"
    def rs = mysql.getConnection().getMetaData().getColumns(null, library, file, null)
    def cols = []
    while (rs.next()) { cols <<  rs.getString("COLUMN_NAME")}
    def insert = "insert into $file ("
    cols.each {insert += "`$it`" + ','}
    insert = insert.replaceAll(/,$/, '')
    insert += ') value('
    cols.each {insert += '?,'}
    insert = insert.replaceAll(/,$/, '')
    insert += ') '
    println insert
	
	def select = "select * from $library.$file fetch first 100 rows only".toString()

    iSeries.eachRow (select) {row ->
        def data = []
        cols.each { 
    		try {
    			data << row[it] 
    		} catch (e) {
    			println "column name causing error: $it"
    			println e
    			assert false
    		}
    	}
		try {
			mysql.execute(insert.toString(), data)
		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException sqle) {
			println "$library.$file: "+sqle
			return // returns from closure so on to next eachRow
		}     
    }
}
mysql.execute("SET FOREIGN_KEY_CHECKS=1".toString())     
println "ALL FILES HAVE BEEN PROCESSED"
