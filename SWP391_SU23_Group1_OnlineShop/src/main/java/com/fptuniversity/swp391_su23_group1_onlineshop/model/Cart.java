/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author laptop
 */
public class Cart {

    private int productID;
    private int accountID;

    public Cart(int accountID) {
        this.accountID = accountID;
    }

    public Cart(int productID, int accountID) {
        this.productID = productID;
        this.accountID = accountID;
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

    @Override
    public String toString() {
        return productID + " " + accountID;
    }

}
