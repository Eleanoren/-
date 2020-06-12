package sql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JdbcCRUDByPreparedStatement {
    private static Connection conn = null;
    private static PreparedStatement st = null;
    private static ResultSet rs = null;

    public List<Map<String, Object>> find(String strSql) {
        List<Map<String, Object>> list = new ArrayList();
        try {
            conn = JDBCunit.getConnection();
            st = conn.prepareStatement(strSql);
            rs = st.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                Map<String, Object> map = new HashMap();
                int columnCount = rsmd.getColumnCount();
                for (int i = 0; i < columnCount; i++) {
                    String columnName = rsmd.getColumnName(i + 1);
                    map.put(columnName, rs.getObject(i + 1));
                }
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCunit.release(conn, st, rs);
            return list;
        }
    }

}
