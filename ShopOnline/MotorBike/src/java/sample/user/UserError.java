/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author thiho
 */
public class UserError {

    private String userId;
    private String fullName;
    private String role;
    private String password;
    private String confirm;

    public UserError() {
        this.userId = "";
        this.fullName = "";
        this.role = "";
        this.password = "";
        this.confirm = "";
    }

    public UserError(String userId, String fullName, String role, String password, String confirm) {
        this.userId = userId;
        this.fullName = fullName;
        this.role = role;
        this.password = password;
        this.confirm = confirm;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

}
