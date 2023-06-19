
package Models;

public class Item {
    private Product product;
    private int quantity;
    private int colorID;
    private int sizeID;

    public Item() {
    }

    public Item(Product product, int quantity, int colorID, int sizeID) {
        this.product = product;
        this.quantity = quantity;
        this.colorID = colorID;
        this.sizeID = sizeID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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
    
    public double getTotalPrice(){
        return this.product.getLastPrice() * this.quantity;
    }
    
    
}
