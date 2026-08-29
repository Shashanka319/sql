package com.corejavaproject.mutlithreadingpractice;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ThreadWithSleep {
    public static void main(String[] args)  {
        ThreadWithSleep threadJoin = new ThreadWithSleep();

        Runnable runnable = threadJoin::getThread;

        Thread thread = new Thread();
        Thread thread2 = new Thread();

        thread.start();
        thread2.start();
    }

    public  void getThread() {
        log.info("{} - Thread is Started", Thread.currentThread().getName());
        try {
            Thread.sleep(9000);
        } catch (InterruptedException e) {
           e.printStackTrace();
        }
        log.info("{} - Thread is Stopped", Thread.currentThread().getName());
    }
}