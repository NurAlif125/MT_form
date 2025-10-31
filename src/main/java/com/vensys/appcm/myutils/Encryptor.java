/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.Properties;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class Encryptor {
    
     // Konfigurasi AES
    private static final int AES_KEY_SIZE = 256;     // ukuran key AES (256 bit)
    private static final int GCM_NONCE_LENGTH = 12;  // panjang IV (nonce) 12 byte → standar AES-GCM
    private static final int GCM_TAG_LENGTH = 128;   // panjang authentication tag (128 bit)
    
     public static void main(String[] args) throws Exception {

//        Scanner scan = new Scanner(System.in);
//        String secretKey = "AKey@VenSys";

//            String secretKey = "", text = "";
//            try {
//                String secret = new SecretKeyLoader().loadSecret();
//                System.out.println("Secret berhasil dimuat (panjang): " + secret);
//
//                // Jangan tampilkan isi secret di log untuk keamanan
//                Encryptor enc = new Encryptor();
//
//                Properties prop = new Properties();
//                InputStream inputStream = SecretKeyLoader.class.getResourceAsStream("/db.properties");
//                String user = "";
//                if (inputStream != null) {
//                    prop.load(inputStream);
//                    user = prop.getProperty("secret_key_path");
//                }else {
//                    System.err.println("SecretKeyLoader.class - db.properties file not found in the classpath");
//                }
//                
//                if (inputStream != null) {
//                    prop.load(inputStream);
//                    text = prop.getProperty("user");
//                }else {
//                    log.error("SecretKeyLoader.class - db.properties file not found in the classpath");
//                }
//                
//                try {
//                    secretKey = new SecretKeyLoader().loadSecret();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                    System.err.println("Error SecretKeyLoader : "+e.getMessage());
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//                System.err.println("Error SecretKeyLoader : "+e.getMessage());
//            }


        String text = "text";
        String secretKey = "QUtleUBWZW5TeXM=";
        System.out.println("Text awal:" + text);
        System.out.println("Secret Key:" + secretKey);
        String codedtext = new Encryptor().encryptTD(text, secretKey);
        String decodedtext = new Encryptor().decryptTD(codedtext, secretKey);
        System.out.println(codedtext + " ---> " + decodedtext);

    }

    // Fungsi untuk membuat kunci AES dari secret string
    private SecretKey getKeyFromPassword(String secretKey) throws Exception {
        // Hash secretKey dengan SHA-256 supaya panjangnya 256 bit
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        byte[] keyBytes = sha.digest(secretKey.getBytes(StandardCharsets.UTF_8));
        // Bungkus jadi SecretKey untuk AES
        return new SecretKeySpec(keyBytes, "AES");
    }
    
     // Fungsi untuk enkripsi
    public String encryptTD(String message, String secretKey) throws Exception {
        SecretKey key = getKeyFromPassword(secretKey);

        // Generate IV/nonce random sepanjang 12 byte
        byte[] iv = new byte[GCM_NONCE_LENGTH];
        SecureRandom random = new SecureRandom();
        random.nextBytes(iv);

        // Inisialisasi AES-GCM dengan IV
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec gcmSpec = new GCMParameterSpec(GCM_TAG_LENGTH, iv);
        cipher.init(Cipher.ENCRYPT_MODE, key, gcmSpec);

        // Enkripsi plaintext → ciphertext
        byte[] ciphertext = cipher.doFinal(message.getBytes(StandardCharsets.UTF_8));

        // Gabungkan IV + ciphertext (karena IV dibutuhkan saat dekripsi)
        byte[] encrypted = new byte[iv.length + ciphertext.length];
        System.arraycopy(iv, 0, encrypted, 0, iv.length);
        System.arraycopy(ciphertext, 0, encrypted, iv.length, ciphertext.length);

        // Encode ke Base64 supaya bisa dikirim/ditaruh di database
        return Base64.getEncoder().encodeToString(encrypted);
    }

    // Fungsi untuk dekripsi
    public String decryptTD(String encryptedText, String secretKey) throws Exception {
        SecretKey key = getKeyFromPassword(secretKey);

        // Decode Base64 → ambil kembali IV + ciphertext
        byte[] decoded = Base64.getDecoder().decode(encryptedText);

        // Pisahkan IV (nonce) dan ciphertext
        byte[] iv = new byte[GCM_NONCE_LENGTH];
        byte[] ciphertext = new byte[decoded.length - GCM_NONCE_LENGTH];
        System.arraycopy(decoded, 0, iv, 0, iv.length);
        System.arraycopy(decoded, iv.length, ciphertext, 0, ciphertext.length);

        // Inisialisasi cipher AES-GCM untuk dekripsi
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec gcmSpec = new GCMParameterSpec(GCM_TAG_LENGTH, iv);
        cipher.init(Cipher.DECRYPT_MODE, key, gcmSpec);

        // Dekripsi ciphertext → plaintext
        byte[] plainText = cipher.doFinal(ciphertext);

        return new String(plainText, StandardCharsets.UTF_8);
    }
    
    private void encSecretKey() throws Exception {
        String originalString = "AKey@VenSys";
        String encoded = Base64.getEncoder()
                               .encodeToString(originalString.getBytes(StandardCharsets.UTF_8));
        System.out.println(encoded);
        byte[] decodedBytes = Base64.getDecoder().decode(encoded);
        String decoded = new String(decodedBytes, StandardCharsets.UTF_8);
        System.out.println(decoded);
    }


//    public String encryptTD(String message, String secretKey) throws Exception {
////        MessageDigest md = MessageDigest.getInstance("SHA-1");
//        MessageDigest md = MessageDigest.getInstance("SHA-256"); //VER SHA-256 update 240306
//        byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
//        byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
//        SecretKey key = new SecretKeySpec(keyBytes, "DESede");
//        Cipher cipher = Cipher.getInstance("DESede");
//        cipher.init(Cipher.ENCRYPT_MODE, key);
//        byte[] plainTextBytes = message.getBytes("utf-8");
//        byte[] buf = cipher.doFinal(plainTextBytes);
//        byte[] base64Bytes = Base64.encodeBase64(buf);
//        String base64EncryptedString = new String(base64Bytes);
//        return base64EncryptedString;
//    }
//
//    public String decryptTD(String encryptedText, String secretKey) throws Exception {
//        byte[] message = Base64.decodeBase64(encryptedText.getBytes("utf-8"));
////        MessageDigest md = MessageDigest.getInstance("SHA-1");
//        MessageDigest md = MessageDigest.getInstance("SHA-256");
//        byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
//        byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
//        SecretKey key = new SecretKeySpec(keyBytes, "DESede");
//        Cipher decipher = Cipher.getInstance("DESede");
//        decipher.init(Cipher.DECRYPT_MODE, key);
//        byte[] plainText = decipher.doFinal(message);
//        return new String(plainText, "UTF-8");
//    }
    
    
}
