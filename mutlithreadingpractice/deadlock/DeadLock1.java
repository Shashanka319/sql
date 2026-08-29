package com.corejavaproject.mutlithreadingpractice.deadlock;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class DeadLock1 {
    public void execute(){
        log.info(Thread.currentThread().getName()+"The Execute can Acces the Resourse");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("The execute has been executed");
    }
}
