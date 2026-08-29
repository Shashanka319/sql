package com.corejavaproject.mutlithreadingpractice.deadlock;
import lombok.extern.log4j.Log4j2;

@Log4j2

public class main {
    public static void main(String[] args) {
        DeadLock deadlock = new DeadLock();
        DeadLock1 deadlock1 = new DeadLock1();

        Runnable runnable = deadlock::print;
        Runnable runnable1 = deadlock1::execute;

       Thread t1 = new Thread(()->{
           synchronized (deadlock) {
               log.info("Thread 1 start with deadlock");
               try {
                   Thread.sleep(1000);
               } catch (InterruptedException e) {
                   e.printStackTrace();
               }
               log.info("Thread 1: Waiting for deadlock1");
           }
           synchronized (deadlock1) {
               log.info("Thread 1: Locking deadlock1");
           }
        });

        Thread t2 = new Thread(() -> {
           synchronized (deadlock1) {
               log.info("Thread 2 start with deadlock1");
               try {
                   Thread.sleep(1000);
               } catch (InterruptedException e) {
                   e.printStackTrace();
               }
               log.info("Thread 2: Waiting for deadlock");
           }
           synchronized (deadlock) {
               log.info("Thread 2: Locking deadlock");
           }
        });
        t1.start();
        t2.start();
    }


}
