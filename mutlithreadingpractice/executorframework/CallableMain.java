package com.corejavaproject.mutlithreadingpractice.executorframework;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class CallableMain {
    public static void main(String[] args) {
        CallableTask ct1 = new CallableTask(101,"Shashank",20000);
        CallableTask ct2 = new CallableTask(102,"Siddarth",20000);
        CallableTask ct3 = new CallableTask(103,"Shankar",20000);
        CallableTask ct4 = new CallableTask(104,"Sharath",569494);
        CallableTask ct5 = new CallableTask(105,"Shashank",20000);

        List<CallableTask> list = List.of(ct1,ct2,ct3,ct4,ct5);

        ExecutorService es = Executors.newFixedThreadPool(5);

        List<Future<CallableTask>> futures = new ArrayList<>();

        try{
            futures = es.invokeAll(list);
        }catch (Exception e){
            e.printStackTrace();
        }

        futures.forEach(f->{
            try{
                CallableTask task =f.get();
                System.out.println("Emp Id :"+task.id);
            }catch (Exception e){
               throw new RuntimeException(e);
            }

        });

    }
}
