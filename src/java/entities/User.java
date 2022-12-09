/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.NamedNativeQuery;

/**
 *
 * @author user
 */
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class User {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected int id;
    protected  String email;
    protected String password;

    public User() {
    }

    public User( String email, String password) {
      
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
     
    
}
