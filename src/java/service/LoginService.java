package service;


import entities.User;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import util.BytesToHex;
public class LoginService {

    public boolean authenticateUser(String email, String password) throws NoSuchAlgorithmException {
        UserService cs = new UserService();
        
        
            MessageDigest digest;
            digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedhash;
            encodedhash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            String encpwd = BytesToHex.bytesToHex(encodedhash);
            User user = cs.findByEmail(email);
              if(user.getPassword().equals(encpwd)){
            return true;
        }else return false;
                   }   }  
        
        
    
       
