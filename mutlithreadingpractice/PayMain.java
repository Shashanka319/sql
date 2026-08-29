package com.corejavaproject.mutlithreadingpractice;

import com.corejavaproject.jdbcwithoracle.Employee;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class PayMain {
    public static void main(String[] args) {
        Pay pay = new Pay("p101","ABCD","BBDD",1000);
        Pay pay1 = new Pay("p102","bvgv0","hrehre",9000);
        Pay pay2 = new Pay("p103","bvgv0","hrehre",1000);
        Pay pay3 = new Pay("p104","bvgv0","hrehre",1000);

        List<Pay> pays=List.of(pay,pay1,pay2,pay3);

        ExecutorService executor = Executors.newFixedThreadPool(2);

        List<Future<Pay>> futures = new ArrayList<>();

        pays.forEach(data->{
            try{
                Future<Pay> f1 = executor.submit(data);
                futures.add(f1);
            }catch (Exception e){
                e.printStackTrace();
            }
        });

        futures.forEach(data->{
            try{
               Pay pay4 = data.get();
                System.out.println("Pay Id:"+pay4.getId()+
                        "Pay Creditor:"+pay4.getCreditor()+
                        "Pay Debitor:"+pay4.getDebitor()+
                        "Amount:"+pay4.getAmount()
                );
            }catch (Exception e){
                e.printStackTrace();
            }
        });
    }
}
