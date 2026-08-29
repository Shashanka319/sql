package com.corejavaproject.mutlithreadingpractice;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class ProductRunner {
    public static void main(String[] args) {
        Product product = new Product(1,"T-shirt",500.0);
        Product product1 = new Product(1,"T-shirt",500.0);
        Product product2 = new Product(2,"T-shirt",500.0);
        Product product3 = new Product(3,"T-shirt",500.0);
        Product product4 = new Product(4,"T-shirt",500.0);

        List<Product> list = List.of(product,product1,product2,product3,product4);

        ExecutorService executor = Executors.newFixedThreadPool(3);

            List<Future<Product>> future = null;
            try{
                future=executor.invokeAll(list);
            }catch (InterruptedException e){
                throw new RuntimeException(e);
            }

            future.forEach(data->{
                try{
                    Product p=data.get();
                    System.out.println("Product Id:"+p.getId()+
                            "||Product Name:"+p.getName()+
                            "||Product Price:"+p.getPrice()
                );
                }catch (Exception e){
                    throw new RuntimeException(e);
                }
            });

    }
}
