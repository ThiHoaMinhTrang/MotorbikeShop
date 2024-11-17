/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author thiho
 */
public class ProductDTO {

    private String itemId;
    private String itemName;
    private String brand;
    private float price;
    private int quantity;
    private String image;
    private int discount;

    public ProductDTO() {
    }

    public ProductDTO(String itemId, String itemName, String brand, float price, int discount) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.brand = brand;
        this.price = price;
        this.discount = discount;
    }

    public ProductDTO(String itemId, String itemName, String brand, float price, int quantity, String image, int discount) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.brand = brand;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.discount = discount;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

}
