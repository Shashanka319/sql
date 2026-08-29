package com.corejavaproject.mutlithreadingpractice;

import lombok.extern.log4j.Log4j2;

@Log4j2

public class SynchronizationBlock extends Thread{
    @Override
    public  void run() {
        log.info("Execute the SynchronizationBlock Using Extends of Thread");
    }
    public void objLevelLock(){
        synchronized (this){
            log.info("Entering process of objLevelLock");
            try{
                Thread.sleep(2000);
            }catch(InterruptedException e){
                e.printStackTrace();
            }
            log.info("Exiting the ptocess objLevelLock");
        }
    }
    public void classLevelLock(){
        synchronized (SynchronizationBlock.class) {
            log.info("Entering process of classLevelLock");
            try{
                Thread.sleep(2000);
            }catch(InterruptedException e){
                e.printStackTrace();
            }
            log.info("Exiting the process classLevelLock");
        }
    }
}
