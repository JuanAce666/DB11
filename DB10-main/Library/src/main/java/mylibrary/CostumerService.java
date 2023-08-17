package mylibrary;

import java.util.Scanner;

public class CostumerService {

    static Scanner sc = new Scanner(System.in);

    public static void createCostumer(){

        System.out.println("Identificacion");
        int id = sc.nextInt();
        System.out.println("Tipo id");
        String docType = sc.next();
        System.out.println("Nombre");
        String name = sc.next();
        System.out.println("Apellido");
        String lastname = sc.next();
        System.out.println("email");
        String email = sc.next();
        System.out.println("Grupo");
        String group = sc.next();

        CostumerModel register = new CostumerModel();
        register.setIdentityDoc(id);
        register.setDocType(docType);
        register.setName(name);
        register.setLastName(lastname);
        register.setEmail(email);
        register.setGroupClass(group);

        CostumerDAO.createCostumerDB(register);

    }

    public static void readCostumer(){
        CostumerDAO.readCostumerDB();

    }

    public static void updateCostumer(){

    }

    public static void deleteCostumer(){

    }
}
