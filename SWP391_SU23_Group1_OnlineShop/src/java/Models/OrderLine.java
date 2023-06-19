package Models;

public class OrderLine {

    private int id;
    private int oid;
    private int quantity;
    private double totalPrice;
    private int colorID;
    private int sizeID;

    private Product product;

    public OrderLine() {
    }

    
    public OrderLine(int id, int oid, int quantity, double totalPrice, int colorID, int sizeID, Product product) {
        this.id = id;
        this.oid = oid;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.colorID = colorID;
        this.sizeID = sizeID;
        this.product = product;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getColorID() {
        return colorID;
    }

    public void setColorID(int colorID) {
        this.colorID = colorID;
    }

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
}
