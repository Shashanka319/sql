package com.corejavaproject.mutlithreadingpractice;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class PaymentRunner {
    public static void main(String[] args) {
        Payment pay = new Payment("P101","ABCD","ASDF",1000.0);
        Payment pay1 = new Payment("P101","ABCD","ASDF",1000.0);
        Payment pay2 = new Payment("P101","ABCD","ASDF",1000.0);
        Payment pay3 = new Payment("P101","ABCD","ASDF",1000.0);
        Payment pay4 = new Payment("P101","ABCD","ASDF",1000.0);

        List<Payment> list = List.of(pay,pay1,pay2,pay3,pay4);

        ExecutorService service = Executors.newFixedThreadPool(2);

        List<Future<Payment>> future = null;

        try{
            future=service.invokeAll(list);
        }catch (InterruptedException exp){
            exp.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }

        future.forEach(data->{
            try{
                Payment pays = data.get();
                System.out.println("Payment Id:"+ pays.getPayId()+
                        "|| Creditor"+ pays.getCreditor()+
                        "|| Debitor"+ pays.getDebtor()+
                        "|| Amount"+ pays.getAmount()
                );
            }
            catch (Exception e){
                throw  new RuntimeException(e);
            }
        });

    }
}
