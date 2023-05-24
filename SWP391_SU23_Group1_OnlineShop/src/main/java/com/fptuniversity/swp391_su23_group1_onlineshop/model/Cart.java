/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author laptop
 */
public class Cart {

    private int productID;
    private int accountID;
    private List<Item> items; //  ds sản phẩm đưa vào giỏ

    public Cart(int accountID) {
        this.accountID = accountID;
    }

    public Cart(int productID, int accountID) {
        this.productID = productID;
        this.accountID = accountID;
        items = new ArrayList<>();
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    // số lượng 1 sản phẩm trong giỏ - khách sẽ mua
    public int getItemQuantity(int id, String sex) {
        return getExactItem(id, sex).getQuantity();
    }

    public Item getExactItem(int productID, String productSize) {
        for (Item i : items) {
            int id = i.getProduct().getProductID();
            String size = i.getSize();
            if (id == productID && size.contains(productSize)) {
                return i;
            }
        }
        return null;
    }
// add 1 sản phẩm vào giỏ, nếu có rồi thì tăng số lượng

    public void addItem(Item t) {
        if (getExactItem(t.getProduct().getProductID(), t.getSize()) != null) {
            Item m = getExactItem(t.getProduct().getProductID(), t.getSize());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
//loại sản phẩm khỏi giỏ

    public void removeItem(int id, String size) {
        if (getExactItem(id, size) != null) {
            items.remove(getExactItem(id, size));
        }
    }
//tổng tiền của cả giỏ hàng – sẽ add vào bảng Order

    public float getTotalMoney() {
        float t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

    @Override
    public String toString() {
        return productID + " " + accountID;
    }

}
