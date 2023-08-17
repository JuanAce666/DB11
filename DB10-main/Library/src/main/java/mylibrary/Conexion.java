package mylibrary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public Connection getConnection(){
        Connection Connection = null;
        try {
            Connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
            if (Connection != null){
                System.out.println("Coneccion Exitosa");
            }
        }catch (SQLException e){
            System.out.println(e);
        }

        return Connection;

    }


}
