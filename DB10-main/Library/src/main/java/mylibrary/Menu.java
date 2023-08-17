package mylibrary;

import java.util.Scanner;

public class Menu {

    Scanner sc = new Scanner(System.in);
    CostumerService costumerService = new CostumerService();

    public void menuApp(){

        int opc;

        do {

            System.out.println("1. Registrar usuario: \n" +
                    "2. Listar usuarios \n" +
                    "3. Actualizar datos de usuario \n" +
                    "4. Borrar datos de usuario \n" +
                    "5. Salir");
            System.out.println("Ingrese una opcion: ");
            opc = sc.nextInt();

            switch (opc){
                case 1:
                    System.out.println("Registro de Usuario");
                    CostumerService.createCostumer();
                    break;
                case 2:
                    System.out.println("Listado de Usuarios");
                    CostumerService.readCostumer();
                    break;
                case 3:
                    System.out.println("Actualizar datos de Usuario");
                    break;
                case 4:
                    System.out.println("Borrar Usuario");
                    break;
                case 5:
                    System.out.println("Salir del Sistema");
                    break;
                default:
                    System.out.println("Ingrese una opcion valida");
            }

        }while (opc!=5);
    }
}
