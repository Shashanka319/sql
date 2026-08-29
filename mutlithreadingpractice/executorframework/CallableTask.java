package com.corejavaproject.mutlithreadingpractice.executorframework;

import java.util.concurrent.Callable;

public class CallableTask implements Callable<CallableTask> {
    int id;
    String empName;
    double empSalary;
    public CallableTask(int id, String empName, double empSalary) {
        this.id = id;
        this.empName = empName;
        this.empSalary = empSalary;
    }
    @Override
    public CallableTask call() throws Exception {
        System.out.println("Start the Execution ");
        try{
            Thread.sleep(1000);
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("End the Execution ");
        return this;
    }
}
