/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csv;

import java.io.FileNotFoundException;
import java.io.IOException;

/**
 *
 * @author TemaAndroid
 */
public class CsvReader {
   public static void main(String[] args) {
		try {
			
			CsvReader products = new CsvReader("products.csv");
		
			products.readHeaders();

			while (products.readRecord())
			{
				String productID = products.get("ProductID");
				String productName = products.get("ProductName");
				String supplierID = products.get("SupplierID");
				String categoryID = products.get("CategoryID");
				String quantityPerUnit = products.get("QuantityPerUnit");
				String unitPrice = products.get("UnitPrice");
				String unitsInStock = products.get("UnitsInStock");
				String unitsOnOrder = products.get("UnitsOnOrder");
				String reorderLevel = products.get("ReorderLevel");
				String discontinued = products.get("Discontinued");
				
				// perform program logic here
				System.out.println(productID + ":" + productName);
			}
	
			products.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

    private CsvReader(String productscsv) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

   

   

    

   
}
