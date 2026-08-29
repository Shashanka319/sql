package com.corejavaproject.mutlithreadingpractice.deadlock;

import lombok.extern.log4j.Log4j2;

@Log4j2

public class DeadLock {
    public void print() {
        log.info(Thread.currentThread().getName()+"Printing is Accessing Resourse");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("End the print method");
    }

}
