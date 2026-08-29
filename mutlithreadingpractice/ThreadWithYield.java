package com.corejavaproject.mutlithreadingpractice;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ThreadWithYield {
    public static void main(String[] args) {
       ThreadWithYield thread = new ThreadWithYield();
       Runnable runnable = thread::print;
       Thread thread1 = new Thread(runnable);
       Thread thread2 = new Thread(runnable);
       thread1.start();
       thread2.start();
    }
    public synchronized  void print(){
        for (int i = 0; i < 10; i++) {
           log.info(Thread.currentThread().getName()+"-"+i);
           if(i == 5){
               log.info(Thread.currentThread().getName()+"is yeilding");
               Thread.yield();
           }
        }
    }
}
