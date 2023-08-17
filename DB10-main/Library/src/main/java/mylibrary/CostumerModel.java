package mylibrary;

public class CostumerModel {

    //Atributos
    private int identityDoc;
    private String docType;
    private String name;
    private String lastName;
    private String email;
    private String groupClass;
    //Construtor vacio
    public CostumerModel(){
    }

    //Constructor con parametros
    public CostumerModel(int identityDoc, String docType, String name, String lastName, String email, String groupClass) {
        this.identityDoc = identityDoc;
        this.docType = docType;
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.groupClass = groupClass;
    }

    //Getters and Setters
    public int getIdentityDoc() {
        return identityDoc;
    }

    public void setIdentityDoc(int identityDoc) {
        this.identityDoc = identityDoc;
    }

    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGroupClass() {
        return groupClass;
    }

    public void setGroupClass(String groupClass) {
        this.groupClass = groupClass;
    }
}
