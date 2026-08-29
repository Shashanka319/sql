package com.corejavaproject.mutlithreadingpractice;

import lombok.extern.log4j.Log4j2;

@Log4j2

public class ThreadWithWait {
    public static void main(String[] args) {
        ThreadWithWait thread = new ThreadWithWait();
        Runnable runnable = ()->{
            thread.print();
        };
        Thread thread1 = new Thread(runnable);
        Thread thread2 = new Thread(runnable);
        thread1.start();
        thread2.start();
    }
    public synchronized  void print() {
        log.info("Start the print method");
        try {
            wait(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("End the print method");
    }
}
