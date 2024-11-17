/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author thiho
 */
public class ProductDAO {

    Connection connection;
    PreparedStatement ps;
    ResultSet rs;

    public boolean deleteProduct(String id) {
        String sql = "DELETE FROM tbl_Items WHERE ItemID=?;";
        boolean response = true;

        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            response = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception ex) {
        }

        return response;
    }

    public boolean updateProduct(String id, float price, int quantity, String brand, String image, int discount) {
        String sql = "UPDATE tbl_Items SET Brand = ?, Price = ?, Quantity = ?,  Image = ?, Discount = ? WHERE ItemID = ?;";
        boolean response = true;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setFloat(1, price);
            ps.setInt(2, quantity);
            ps.setString(3, brand);
            ps.setString(4, image);
            ps.setInt(5, discount);
            response = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception ex) {
        }
        return response;
    }

    public List<ProductDTO> getAllProduct() {
        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "select * from tbl_Items";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getString("ItemID"),
                        rs.getString("ItemName"),
                        rs.getString("Brand"),
                        rs.getInt("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("Discount")
                );
                ProductList.add(product);

            }
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return ProductList;
    }

    public List<ProductDTO> getAllByIdAndName(String name) {
        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tbl_Items WHERE ItemName LIKE ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, '%' + name + '%');

            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getString("ItemID"),
                        rs.getString("ItemName"),
                        rs.getString("Brand"),
                        rs.getInt("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("Discount")
                );
                ProductList.add(product);
            }
        } catch (Exception ex) {
        }
        return ProductList;
    }
    public List<ProductDTO> getAllByName(String name) throws Exception {
    List<ProductDTO> products = new ArrayList<>();
    String sql = "SELECT * FROM tbl_Items WHERE ItemName LIKE ?";

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, "%" + name + "%");
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String itemId = rs.getString("ItemId");
                String itemName = rs.getString("ItemName");
                String brand = rs.getString("Brand");
                float price = rs.getFloat("Price");
                int quantity = rs.getInt("Quantity");
                String image = rs.getString("Image");
                int discount = rs.getInt("Discount");

                ProductDTO product = new ProductDTO(itemId, itemName, brand, price, quantity, image, discount);
                products.add(product);
            }
        }
    }

    return products;
}

    public List<ProductDTO> getAllByMinMax(float min, float max) {
        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tbl_Items WHERE Price between ? and ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setFloat(1, min);
            ps.setFloat(2, max);

            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getString("ItemID"),
                        rs.getString("ItemName"),
                        rs.getString("Brand"),
                        rs.getInt("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("Discount")
                );
                ProductList.add(product);

            }
        } catch (Exception ex) {
        }

        return ProductList;
    }
    
        public List<ProductDTO> getAllByBrand(String brand) {
        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tbl_Items WHERE Brand like ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1,'%' + brand + '%');

            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getString("ItemID"),
                        rs.getString("ItemName"),
                        rs.getString("Brand"),
                        rs.getInt("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("Discount")
                );
                ProductList.add(product);

            }
        } catch (Exception ex) {
        }

        return ProductList;
    }

    public boolean createProduct(ProductDTO product) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO tbl_Items (ItemID,ItemName,Brand,Price,Quantity,Image,Discount)VALUES (?, ?, ?, ?, ?, ?, ?)";
        boolean response = false;
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setString(1, product.getItemId().trim());
                ps.setString(2, product.getItemName());
                ps.setString(3, product.getBrand());
                ps.setFloat(4, product.getPrice());
                ps.setInt(5, product.getQuantity());
                ps.setString(6, product.getImage());
                ps.setInt(7, product.getDiscount());
                response = ps.executeUpdate() > 0;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return response;
    }

    public boolean checkDuplicate(String mdID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT ItemID FROM tbl_Items WHERE ItemID=?  ");
                ptm.setString(1, mdID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

//    public boolean addProductToWishList(String userId, String mobileId) throws ClassNotFoundException, SQLException {
//        String sql = "INSERT INTO tbl_WishList (userId, mobileId) VALUES (?, ?)";
//        boolean response = false;
//        Connection connection = null;
//        PreparedStatement ps = null;
//        try {
//            connection = DBUtils.getConnection();
//            if (connection != null) {
//                ps = connection.prepareStatement(sql);
//                ps.setString(1, userId);
//                ps.setString(2, mobileId);
//                response = ps.executeUpdate() > 0;
//            }
//        } finally {
//            if (ps != null) {
//                ps.close();
//            }
//            if (connection != null) {
//                connection.close();
//            }
//        }
//        return response;
//    }
//
//    public boolean checkDuplicateWishList(String userId, String mdID) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement("SELECT mobileId, userId FROM tbl_WishList WHERE mobileId=? and userId = ? ");
//                ptm.setString(1, mdID);
//                ptm.setString(2, userId);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    check = true;
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
//
//    public List<ProductDTO> getAllWishList(String userId) {
//        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
//        ProductDTO product;
//        String sql = "select * from tbl_Mobile m join tbl_WishList w on w.mobileId= m.mobileId where w.userId= ?";
//        try {
//            connection = DBUtils.getConnection();
//            ps = connection.prepareStatement(sql);
//            ps.setString(1, userId);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                product = new ProductDTO(
//                        rs.getString("m.mobileId"),
//                        rs.getString("m.description"),
//                        rs.getInt("m.price"),
//                        rs.getString("m.mobileName"),
//                        rs.getInt("m.yearOfProduction"),
//                        rs.getString("m.brand"),
//                        rs.getString("m.image"),
//                        rs.getInt("m.discount")
//                );
//                ProductList.add(product);
//            }
//        } catch (Exception ex) {
//        }
//
//        return ProductList;
//    }
//
//    public List<ProductDTO> getAllByMinMax2(float min, float max, String brand, String userId) {
//        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
//        ProductDTO product;
//        String sql = "SELECT * FROM tbl_Mobile m join tbl_WishList w on w.mobileId= m.mobileId WHERE (m.price between ? and ?) and m.brand like ? and w.userId=?";
//        try {
//            connection = DBUtils.getConnection();
//            ps = connection.prepareStatement(sql);
//            ps.setFloat(1, min);
//            ps.setFloat(2, max);
//            ps.setString(3, "%" + brand + "%");
//            ps.setString(4, userId);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                product = new ProductDTO(
//                        rs.getString("mobileId"),
//                        rs.getString("description"),
//                        rs.getInt("price"),
//                        rs.getString("mobileName"),
//                        rs.getInt("yearOfProduction"),
//                        rs.getString("brand"),
//                        rs.getInt("discount")
//                );
//
//                ProductList.add(product);
//
//            }
//        } catch (Exception ex) {
//        }
//
//        return ProductList;
//    }
//
//    public boolean deleteWishList(String id, String user) {
//        String sql = "DELETE FROM tbl_WishList WHERE mobileId=? and userId=?;";
//        boolean response = true;
//
//        try {
//            connection = DBUtils.getConnection();
//            ps = connection.prepareStatement(sql);
//            ps.setString(1, id);
//            ps.setString(2, user);
//            response = ps.executeUpdate() > 0 ? true : false;
//        } catch (Exception ex) {
//        }
//
//        return response;
//    }
    public List<ProductDTO> getAllByMinMax3(float min, float max, String brand) {
        List<ProductDTO> ProductList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tbl_Items WHERE (Price between ? and ?) and Brand like ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setFloat(1, min);
            ps.setFloat(2, max);
            ps.setString(3, "%" + brand + "%");

            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getString("ItemID"),
                        rs.getString("ItemName"),
                        rs.getString("Brand"),
                        rs.getInt("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("Discount")
                );

                ProductList.add(product);

            }
        } catch (Exception ex) {
        }

        return ProductList;
    }
}
